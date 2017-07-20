//
//  Yaku24.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku24 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 18,チートイ
    
    // 19,チーシン
    
    // 20,チェンシャンク : 引数 kata1, kata2, kata3, kata4, all
    func chenshanku(k1:Int, k2:Int, k3:Int, k4:Int, a:[Int])->() {
        let area = [0,2,4,6,8,9,11,13,15,17,18,20,22,24,26,27,28,29,30,31,32,33]  // 全双刻にならない牌
        var x = 0
        for i in area {
            if a[i] >= 3 {
                x += 1
            }
        }
        if x == 0, yaku[20] != -1, k1 >= 1, k2 >= 1, k3 >= 1, k4 >= 1 {
            yaku[20] = 1
            yaku[48] = -1; yaku[68] = -1; yaku[76] = -1;
        }
    }
    
    // 21,チンイツ : 引数 man, pin, sou, ji
    func chinitu(m:[Int], p:[Int], s:[Int], j:[Int])->() {
        var x = 0, y = 0, z = 0, w = 0
        for i in m {
            x += i
        }
        for i in p {
            y += i
        }
        for i in s {
            z += i
        }
        for i in j {
            w += i
        }
        if (y == 0 && z == 0 && w == 0) ||
            (x == 0 && z == 0 && w == 0) ||
            (x == 0 && y == 0 && w == 0) {
            if yaku[21] != -1 {
                yaku[21] = 1
                yaku[76] = -1
            }
        }
    }
    
    // 22,イーソーサントンシュン : 引数 kata1, kata2, men1, men2, men3, men4
    func isosantonshun(k1:Int, k2:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if (k1 == 0 && m1 == m2 && m1 == m3) || (k2 == 0 && m2 == m3 && m2 == m4) {
            if yaku[22] != -1 {
                yaku[22] = 1
                yaku[23] = -1; yaku[69] = -1;
            }
        }
    }
    
    // 23,イーソーサンチェカオ : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func isosanchekao(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if (k1 >= 1 && k2 >= 1 && k3 >= 1 && m1[0] - m2[0] == -1 && m2[0] - m3[0] == -1) ||
            (k1 >= 1 && k2 >= 1 && k4 >= 1 && m1[0] - m2[0] == -1 && m2[0] - m4[0] == -1) ||
            (k1 >= 1 && k3 >= 1 && k4 >= 1 && m1[0] - m3[0] == -1 && m3[0] - m4[0] == -1) ||
            (k2 >= 1 && k3 >= 1 && k4 >= 1 && m2[0] - m3[0] == -1 && m3[0] - m4[0] == -1) {
            if yaku[23] != -1 {
                yaku[23] = 1
                yaku[22] = -1
            }
        }
    }
    
    // 24,チェンター : 引数 all
    func chenta(a:[Int])->() {
        let area = [0,1,2,3,4,5,9,10,11,12,13,14,18,19,20,21,22,23,27,28,29,30,31,32,33]   // 全大にならない牌
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[24] != -1 {
            yaku[24] = 1
            yaku[35] = -1; yaku[76] = -1;
        }
    }
    
    // 25,チェンチュン : 引数 all
    func chenchun(a:[Int])->() {
        let area = [0,1,2,6,7,8,9,10,11,15,16,17,18,19,20,24,25,26,27,28,29,30,31,32,33]   // 全中にならない牌
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[25] != -1 {
            yaku[25] = 1
            yaku[68] = -1; yaku[76] = -1;
        }
    }
    
    // 26,チェンシャオ : 引数 all
    func chenshao(a:[Int])->() {
        let area = [3,4,5,6,7,8,12,13,14,15,16,17,21,22,23,24,25,26,27,28,29,30,31,32,33]   // 全小にならない牌
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[26] != -1 {
            yaku[26] = 1
            yaku[36] = -1; yaku[76] = -1;
        }
    }

    
}
