//
//  AgariHantei.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/25.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

// 上がり判定をするメソッド
// 常にヘッドが最初、鳴きがあればそれが次に入る配列を生成する
class AgariHantei {
    
    var all = [Int]()       // 全ての牌姿
    var naki = [[Int]]()    // 鳴きで確定している面子
    var mentsu = [[Int]]()  // 面子構成を入れる
    var agari = [[[Int]]]() // mentsuたちを入れる
    
    init(n:[[Int]]) {
        self.naki = n
    }
    
    // ヘッドを探す
    // ヘッド候補を取り出し、それをmentsuのヘッド部分に入れ、残りを調査する
    func headSearch(a:[Int])->() {
        var a = a
        
        var num = 0
        for i in a {
            if i >= 2 {
                a[num] -= 2
                mentsu.append([num, num])
                mentsu += naki
                mentsuSearch(a: a)
                
                a[num] += 2; mentsu = [[Int]]();
            }
            num += 1
        }
        
        print(agari)
    }
    
    // ヘッドを抜いた面子で上がりが成立するか判定する
    // コーツの可能性の個数で分けて、シュンツのみの候補からなる配列にして調査する
    func mentsuSearch(a:[Int])->() {
        var a = a
        let mentsuReset = mentsu
        
        var anko = [Int]()  // アンコの場所
        var num = 0
        // まずアンコの可能性を探す
        for i in a {
            if i >= 3 {
                anko.append(num)
            }
            num += 1
        }
        
        // アンコ数 = 4 : スーアンク確定
        if anko.count == 4 {
            for i in anko {
                if i == 3 { mentsu.append([i, i, i]) }
                else { mentsu.append([i, i, i, i]) }
            }
            agari.append(mentsu)
        }
        
        // アンコ数 = 3 : 場合分け
        if anko.count == 3 {
            // ０個
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            
            // １個 : ３通り
            a[anko[0]] -= 3
            mentsu = mentsuReset
            mentsu.append([Int](repeating: anko[0], count: 3))
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            a[anko[0]] += 3; a[anko[1]] -= 3;
            mentsu = mentsuReset
            mentsu.append([Int](repeating: anko[1], count: 3))
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            a[anko[1]] += 3; a[anko[2]] -= 3;
            mentsu = mentsuReset
            mentsu.append([Int](repeating: anko[2], count: 3))
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            
            // ２個 : ３通り
            a[anko[0]] -= 3
            mentsu = mentsuReset
            mentsu += [[anko[0], anko[0], anko[0]], [anko[2], anko[2], anko[2]]]
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            a[anko[0]] += 3; a[anko[1]] -= 3;
            mentsu = mentsuReset
            mentsu += [[anko[2], anko[2], anko[2]], [anko[1], anko[1], anko[1]]]
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            a[anko[2]] += 3; a[anko[0]] -= 3;
            mentsu = mentsuReset
            mentsu += [[anko[0], anko[0], anko[0]], [anko[1], anko[1], anko[1]]]
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            
            // ３個 : １通り
            a[anko[2]] -= 3;
            mentsu = mentsuReset
            mentsu += [[anko[0], anko[0], anko[0]], [anko[1], anko[1], anko[1]], [anko[2], anko[2], anko[2]]]
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
        }
        
        // アンコ数 = 2 : 場合分け
        if anko.count == 2 {
            // ０個
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            
            // １個 : ２通り
            a[anko[0]] -= 3
            mentsu = mentsuReset
            mentsu.append([Int](repeating: anko[0], count: 3))
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            a[anko[0]] += 3; a[anko[1]] -= 3;
            mentsu = mentsuReset
            mentsu.append([Int](repeating: anko[1], count: 3))
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            
            // ２個：１通り
            a[anko[0]] -= 3
            mentsu = mentsuReset
            mentsu += [[anko[0], anko[0], anko[0]], [anko[1], anko[1], anko[1]]]
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
        }
        
        // アンコ数 = 1 : 場合分け
        if anko.count == 1 {
            // アンコ０個で確認
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
            
            // アンコ１個で確認
            a[anko[0]] -= 3
            mentsu = mentsuReset
            mentsu.append([anko[0], anko[0], anko[0]])
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
        }
        
        // アンコ数 = 0 : 確定
        if anko.count == 0 {
            if shuntsuSearch(a: a) {
                agari.append(mentsu)
            }
        }
        
    }

    func shuntsuSearch(a:[Int])->Bool {
        var a = a
        var shuntsu = [[Int]]()
        
        var shuntsuHead = [Int]()
        var num = 0
        for i in a {
            if i > 0 {
                shuntsuHead.append(num)
            }
            num += 1
        }
        
        for i in shuntsuHead {
            let x = [7,8,16,17,25,26,27,28,29,30,31,32,33]
            if x.contains(i) {
                continue
            }
            while a[i] > 0 {
                a[i] -= 1; a[i + 1] -= 1; a[i + 2] -= 1;
                shuntsu.append([i, i + 1, i + 2])
            }
        }
        let test = [Int](repeating: 0, count: 34)
        if a == test {
            mentsu += shuntsu
            return true
        } else {
            return false
        }
    }    
}
