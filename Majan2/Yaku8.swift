//
//  Yaku8.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation


class Yaku8 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 38,ファロン : 引数 men1, men2, men3, men4
    func faron(m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if faron2(m1:m1, m2:m2, m3:m3) || faron2(m1: m1, m2: m2, m3: m4) || faron2(m1: m1, m2: m3, m3: m4) || faron2(m1: m2, m2: m3, m3: m4) {
            if yaku[38] != -1 {
                yaku[38] = 1
            }
        }
    }
    
    
    // 38-2,ファロン : 引数 ファロン候補の３面子、ファロンが成立するかどうかチェックする
    func faron2(m1:[Int], m2:[Int], m3:[Int])->Bool {
        let check = m2 + m3
        var x = false
        if m1 == [0,1,2] {
            if check == [12,13,14,24,25,26] || check == [15,16,17,21,22,23] {
                x = true
            }
        } else if m1 == [3,4,5] {
            if check == [9,10,11,24,25,26] || check == [15,16,17,18,19,20] {
                x = true
            }
        } else if m1 == [6,7,8] {
            if check == [9,10,11,21,22,23] || check == [12,13,14,18,19,20] {
                x = true
            }
        }
        return x
    }
    
    // 39,トイプタオ : 引数 all
    func toiputao(a:[Int])->() {
        let area = [0,1,2,3,4,5,6,7,8,14,15,18,20,24,27,28,29,30,31,32,33]   // トイプタオにならない牌
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[39] != -1 {
            yaku[39] = 1
            yaku[75] = -1
        }
    }
    
    // 40,サンソーサントンシュン : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func sansosantonshun(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if (k1 == 0 && k2 == 0 && k3 == 0 && m2[0] - m1[0] == 9 && m3[0] - m2[0] == 9) ||
            (k1 == 0 && k2 == 0 && k4 == 0 && m2[0] - m1[0] == 9 && m4[0] - m2[0] == 9) ||
            (k1 == 0 && k3 == 0 && k4 == 0 && m3[0] - m1[0] == 9 && m4[0] - m3[0] == 9) ||
            (k2 == 0 && k3 == 0 && k4 == 0 && m3[0] - m2[0] == 9 && m4[0] - m3[0] == 9) {
            if yaku[40] != -1 {
                yaku[40] = 1
                yaku[70] = -1
            }
        }
    }
    
    // 41,サンソーサンチェカオ : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func sansosanchekao(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        var x = false
        if k1 >= 1, k2 >= 1, k3 >= 1 {
            x = sansosanchekao2(m1: m1, m2: m2, m3: m3)
        }
        if k1 >= 1, k2 >= 1, k4 >= 1, !x {
            x = sansosanchekao2(m1: m1, m2: m2, m3: m4)
        }
        if k1 >= 1, k3 >= 1, k4 >= 1, !x {
            x = sansosanchekao2(m1: m1, m2: m3, m3: m4)
        }
        if k2 >= 1, k3 >= 1, k4 >= 1, !x {
            x = sansosanchekao2(m1: m2, m2: m3, m3: m4)
        }
        if x, yaku[41] != -1 {
            yaku[41] = 1
        }
    }
    
    // 41-2,サンソーサンチェカオ : 引数 : コーツ判定した３面子、サンチェカオが成立するか調べる
    func sansosanchekao2(m1:[Int], m2:[Int], m3:[Int])->Bool {
        if (m2[0] - m1[0] == 10 && m3[0] - m2[0] == 10) ||
            (m2[0] - m1[0] == 11 && m3[0] - m2[0] == 8) ||
            (m2[0] - m1[0] == 10 && m3[0] - m2[0] == 7) ||
            (m2[0] - m1[0] == 8 && m3[0] - m2[0] == 11) ||
            (m2[0] - m1[0] == 8 && m3[0] - m2[0] == 8) ||
            (m2[0] - m1[0] == 7 && m3[0] - m2[0] == 10) {
            return true
        } else {
            return false
        }
    }
    
    // 42,ウーファンフー
    
    // 43,ミャオシャオフィチェン
    
    // 44,ハイテイラオユエ
    
    // 45,カンシャンカイファ
    
    // 46,チャンカンフー
    
    // 47,シャンアンカン : 引数 kata1, kata2, kata3, kata4, naki
    func shanankan(k1:Int, k2:Int, k3:Int, k4:Int, n:[Bool])->() {
        if (k1 == 2 && k2 == 2 && !n[0] && !n[1]) ||
            (k1 == 2 && k3 == 2 && !n[0] && !n[2]) ||
            (k1 == 2 && k4 == 2 && !n[0] && !n[3]) ||
            (k2 == 2 && k3 == 2 && !n[1] && !n[2]) ||
            (k2 == 2 && k4 == 2 && !n[1] && !n[3]) ||
            (k3 == 2 && k4 == 2 && !n[2] && !n[3]) {
            if yaku[47] != -1 {
                yaku[47] = 1
                yaku[67] = -1
            }
        }
    }
    

    
    
}
