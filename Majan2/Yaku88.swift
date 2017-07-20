//
//  Yaku88.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku88 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }

    // 0,タースーシー : 引数 ji
    func tasusi(j:[Int])->() {
        if yaku[0] != -1 {
            if j[0] >= 3, j[1] >= 3, j[2] >= 3, j[3] >= 3 {
                yaku[0] = 1
                yaku[8] = -1; yaku[37] = -1; yaku[48] = -1; yaku[60] = -1; yaku[73] = -1;
            }
        }
    }

    // 1,ダイサンゲン : 引数 ji
    func daisangen(j:[Int])->() {
        if yaku[1] != -1 {
            if j[4] >= 3, j[5] >= 3, j[6] >= 3 {
                yaku[1] = 1
                yaku[9] = -1; yaku[53] = -1; yaku[59] = -1;
            }
        }
    }

    // 2,リューイーソー : 引数 all
    func ryuiso(a:[Int])->() {
        let area = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,22,24,26,27,28,29,30,31,33]  //  緑一色にいらない牌の場所
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[2] != -1 {
            yaku[2] = 1
            yaku[49] = -1
        }
    }

    // 3,チューレン :

    // 4,スーカン : 引数 kata1, kata2, kata3, kata4
    func sukan(k1:Int, k2:Int, k3:Int, k4:Int)->() {
        if yaku[4] != -1, k1 == 2, k2 == 2, k3 == 2, k4 == 2 {
            yaku[4] = 1
            yaku[16] = -1; yaku[48] = -1; yaku[79] = -1; yaku[47] = -1; yaku[57] = -1; yaku[67] = -1; yaku[74] = -1;
        }
    }

    // 5,レンチートイ

    // 6,シーサンヤオ
}
