//
//  Yaku64.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku64 {
    
    var yaku = [Int]()

    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 7,チンヤオチュー : 引数 all
    func chinyaochu(a:[Int])->() {
        let area = [1,2,3,4,5,6,7,10,11,12,13,14,15,16,19,20,21,22,23,24,25,27,28,29,30,31,32,33]  // チンヤオチューにいらない牌
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[7] != -1 {
            yaku[7] = 1
            yaku[17] = -1; yaku[48] = -1; yaku[55] = -1; yaku[73] = -1; yaku[76] = -1;
        }
    }
    
    // 8,ショースーシー : 引数 jipai
    func shosusi(j:[Int])->() {
        if (j[0] >= 3 && j[1] >= 3 && j[2] >= 3 && j[3] == 2) ||
            (j[0] >= 3 && j[1] >= 3 && j[2] == 2 && j[3] >= 3) ||
            (j[0] >= 3 && j[1] == 2 && j[2] >= 3 && j[3] >= 3) ||
            (j[0] == 2 && j[1] >= 3 && j[3] >= 3 && j[3] >= 3) {
            if yaku[8] != -1 {
                yaku[8] = 1
                yaku[37] = -1; yaku[73] = -1;
            }
        }
    }
    
    // 9,ショーサンゲン : 引数 jipai
    func shosangen(j:[Int])->() {
        if(j[4] >= 3 && j[5] >= 3 && j[6] == 2) ||
            (j[4] >= 3 && j[5] == 2 && j[6] >= 3) ||
            (j[4] == 2 && j[5] >= 3 && j[6] >= 3) {
            if yaku[9] != -1 {
                yaku[9] = 1
                yaku[53] = -1; yaku[59] = -1;
            }
        }
    }
    
    // 10,ツーイーソー : 引数 man, pin, sou
    func tuiso(m:[Int], p:[Int], s:[Int])->() {
        var x = 0
        for i in 0...8 {
            if m[i] > 0 || p[i] > 0 || s[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[10] != -1 {
            yaku[10] = 1
            yaku[17] = -1; yaku[48] = -1; yaku[55] = -1; yaku[73] = -1;
        }
    }
    
    // 11,スーアンク : 引数 kata1, kata2, kata3, kata4, naki
    func suanku(k1:Int, k2:Int, k3:Int, k4:Int, n:[Bool])->() {
        var x = 0
        for i in n {
            if i {
                x += 1
            }
        }
        if x == 0, yaku[11] != -1, k1 >= 1, k2 >= 1, k3 >= 1, k4 >= 1 {
            yaku[11] = 1
            yaku[62] = -1; yaku[66] = -1; yaku[32] = -1; yaku[48] = -1;
        }
    }
    
    // 12,イーソーシャンロンフィ : 引数 man, pin, sou
    func isoshanronfi(m:[Int], p:[Int], s:[Int])->() {
        if (m[0] == 2 && m[1] == 2 && m[2] == 2 && m[4] == 2 && m[6] == 2 && m[7] == 2 && m[8] == 2) ||
            (p[0] == 2 && p[1] == 2 && p[2] == 2 && p[4] == 2 && p[6] == 2 && p[7] == 2 && p[8] == 2) ||
            (s[0] == 2 && s[1] == 2 && s[2] == 2 && s[4] == 2 && s[6] == 2 && s[7] == 2 && s[8] == 2) {
            if yaku[12] != -1 {
                yaku[12] = 1
                yaku[18] = -1; yaku[21] = -1; yaku[63] = -1; yaku[69] = -1; yaku[72] = -1; yaku[76] = -1;
            }
        }
    }

}
