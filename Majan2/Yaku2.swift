//
//  Yaku2.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku2 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 59,チェンク : 引数 ji
    func chenku(j:[Int])->() {
        if (j[4] >= 3 && j[5] <= 2 && j[6] <= 2) ||
            (j[4] <= 2 && j[5] >= 3 && j[6] <= 2) ||
            (j[4] <= 2 && j[5] <= 2 && j[6] >= 3) {
            if yaku[59] != -1 {
                yaku[59] = 1
            }
        }
    }
    
    // 60,チェンフォンク : 引数 ba, ji
    func chenfonku(b:Int, j:[Int])->() {
        if j[b] >= 3, yaku[60] != -1 {
            yaku[60] = 1
            yaku[73] = -1
        }
    }
    
    // 61,メンフォンク : 引数 ie, ji
    func menfonku(i:Int, j:[Int])->() {
        if j[i] >= 3, yaku[61] != -1 {
            yaku[61] = 1
            yaku[73] = -1
        }
    }
    
    // 62,メンゼンチン : 引数 naki, tumo
    func menzenchin(n:[Bool], t:Bool)->() {
        if yaku[62] != -1, !n[0], !n[1], !n[2], !n[3], !t {
            yaku[62] = 1
        }
    }
    
    // 63,ピンフ : 引数 kata1, kata2, kata3, kata4, head
    func pinhu(k1:Int, k2:Int, k3:Int, k4:Int, h:Int)->() {
        if yaku[63] != -1, k1 == 0, k2 == 0, k3 == 0, k4 == 0, h <= 26{
            yaku[63] = 1
        }
    }
    
    // 64,スークーイー : 引数 kata1, kata2, kata3, kata4, all
    func sukui(k1:Int, k2:Int, k3:Int, k4:Int, a:[Int])->() {
        var x = 0
        for i in a {
            if i == 4 {
                x += 1
            }
        }
        let check = [k1, k2, k3, k4]
        for i in check {
            if i == 2 {
                x -= 1
            }
        }
        if x > 0, yaku[64] != -1 {
            yaku[64] = x
        }
    }
    
    // 65,シャントンク : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func shantonku(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if yaku[65] != -1 {
            if (k1 >= 1 && k2 >= 1 && m2[0] - m1[0] == 9) { yaku[65] += 1 }
            if (k1 >= 1 && k3 >= 1 && m3[0] - m1[0] == 9) { yaku[65] += 1 }
            if (k1 >= 1 && k4 >= 1 && m4[0] - m1[0] == 9) { yaku[65] += 1 }
            if (k2 >= 1 && k3 >= 1 && m3[0] - m2[0] == 9) { yaku[65] += 1 }
            if (k2 >= 1 && k4 >= 1 && m4[0] - m2[0] == 9) { yaku[65] += 1 }
            if (k3 >= 1 && k4 >= 1 && m4[0] - m3[0] == 9) { yaku[65] += 1 }
        }
    }
    
    // 66,シャンアンク : 引数 kata1, kata2, kata3, kata4, naki
    func shananku(k1:Int, k2:Int, k3:Int, k4:Int, n:[Bool])->() {
        if (k1 >= 1 && k2 >= 1 && !n[0] && !n[1]) ||
            (k1 >= 1 && k3 >= 1 && !n[0] && !n[2]) ||
            (k1 >= 1 && k4 >= 1 && !n[0] && !n[3]) ||
            (k2 >= 1 && k3 >= 1 && !n[1] && !n[2]) ||
            (k2 >= 1 && k4 >= 1 && !n[1] && !n[3]) ||
            (k3 >= 1 && k4 >= 1 && !n[2] && !n[3]) {
            if yaku[66] != -1 {
                yaku[66] = 1
            }
        }
    }
    
    // 67,アンカン : 引数 kata1, kata2, kata3, kata4, naki
    func ankan(k1:Int, k2:Int, k3:Int, k4:Int, n:[Bool])->() {
        if (k1 == 2 && !n[0]) || (k2 == 2 && !n[1]) || (k3 == 2 && !n[2]) || (k4 == 2 && !n[3]) {
            if yaku[67] != -1 {
                yaku[67] = 1
            }
        }
    }
    
    // 68,タンヤオ : 引数 all
    func tanyao(a:[Int])->() {
        let area = [0,8,9,17,18,26,27,28,29,30,31,32,33]   // タンヤオにならない牌
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[68] != -1 {
            yaku[68] = 1
            yaku[76] = -1
        }
    }
    
}
