//
//  Yaku4.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku4 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 55,チェンタイヤオ : 引数 men1, men2, men3, men4, head
    func chentaiyao(m1:[Int], m2:[Int], m3:[Int], m4:[Int], h:Int)->() {
        let area = [0,8,9,17,18,26,27,28,29,30,31,32,33]  // ヤオチューパイたち
        if yaku[55] != -1, chentaiyao2(a: m1), chentaiyao2(a: m2), chentaiyao2(a: m3), chentaiyao2(a: m4), area.contains(h) {
            yaku[55] = 1
        }
    }
    
    // 55-2,チェンタイヤオ : 引数 面子１個でヤオチュウパイを含むか調べる
    func chentaiyao2(a:[Int])->Bool {
        var x = 0
        let area = [0,8,9,17,18,26,27,28,29,30,31,32,33]  // ヤオチューパイたち
        for i in a {
            if area.contains(i) {
                x += 1
            }
        }
        if x > 0 {
            return true
        } else {
            return false
        }
    }
    
    // 56,プチューレン : 引数 tumo, naki
    func puchuren(t:Bool, n:[Bool])->() {
        if t, !n[0], !n[1], !n[2], !n[3], yaku[56] != -1 {
            yaku[56] = 1
            yaku[80] = -1
        }
    }
    
    // 57,シャンミンカン : 引数 kata1, kata2, kata3, kata4, naki
    func shanminkan(k1:Int, k2:Int, k3:Int, k4:Int, n:[Bool])->() {
        if (k1 == 2 && k2 == 2 && n[0] && n[1]) ||
            (k1 == 2 && k3 == 2 && n[0] && n[2]) ||
            (k1 == 2 && k4 == 2 && n[0] && n[3]) ||
            (k2 == 2 && k3 == 2 && n[1] && n[2]) ||
            (k2 == 2 && k4 == 2 && n[1] && n[3]) ||
            (k3 == 2 && k4 == 2 && n[2] && n[3]) {
            if yaku[57] != -1 {
                yaku[57] = 1
                yaku[74] = -1
            }
        }
    }
    
    // 58,フーチェチャン : 引数
    
    
}
