//
//  Yaku32.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku32 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 15,イーソースープカオ : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func isosupukao(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if k1 == 0, k2 == 0, k3 == 0, k4 == 0, yaku[15] != -1 {
            if (m1[0] - m2[0] == -1 && m2[0] - m3 [0] == -1 && m3[0] - m4[0] == -1) ||
                (m1[0] - m2[0] == -2 && m2[0] - m3 [0] == -2 && m3[0] - m4[0] == -2) {
                yaku[15] = 1
                yaku[29] = -1; yaku[71] = -1; yaku[72] = -1;
            }
        }
    }
    
    // 16,サンカン : 引数 kata1, kata2, kata3, kata4
    func sankan(k1:Int, k2:Int, k3:Int, k4:Int)->() {
        if (k1 == 2 && k2 == 2 && k3 == 2 && k4 != 2) ||
            (k1 == 2 && k2 == 2 && k3 != 2 && k4 == 2) ||
            (k1 == 2 && k2 != 2 && k3 == 2 && k4 == 2) ||
            (k1 != 2 && k2 == 2 && k3 == 2 && k4 == 2) {
            if yaku[16] != -1 {
                yaku[16] = 1
                yaku[47] = -1; yaku[57] = -1; yaku[67] = -1; yaku[74] = -1;
            }
        }
    }
    
    // 17,フンヤオチュー : 引数 man, pin, sou, ji
    func hunyaochu(m:[Int], p:[Int], s:[Int], j:[Int])->() {
        var x = 0, y = 0
        for i in 1...7 {
            if m[i] > 0 || p[i] > 0 || s[i] > 0 {
                x += 1
            }
        }
        for i in j {
            y += i
        }
        if x == 0, y != 0, yaku[17] != -1 {
            yaku[17] = 1
            yaku[48] = -1; yaku[55] = -1; yaku[73] = -1;
        }
    }
    
}
