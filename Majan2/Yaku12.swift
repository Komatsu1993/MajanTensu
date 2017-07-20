//
//  Yaku12.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku12 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 33,チェンプカオ
    
    // 34,ツーハーロン
    
    // 35,ターユーウ : 引数 all
    func tayu(a:[Int])->() {
        let area = [0,1,2,3,4,9,10,11,12,13,18,19,20,21,22,27,28,29,30,31,32,33]   // シャオユーウーにならない牌
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[35] != -1 {
            yaku[35] = 1
            yaku[76] = -1
        }
    }
    
    // 36,シャオユーウ : 引数 all
    func shaoyu(a:[Int])->() {
        let area = [4,5,6,7,8,13,14,15,16,17,22,23,24,25,26,27,28,29,30,31,32,33]   // ターユーウーにならない牌
        var x = 0
        for i in area {
            if a[i] > 0 {
                x += 1
            }
        }
        if x == 0, yaku[36] != -1 {
            yaku[36] = 1
            yaku[76] = -1
        }
    }
    
    // 37,サンフォンク : 引数 ji
    func sanfonku(j:[Int])->() {
        if (j[0] >= 3 && j[1] >= 3 && j[2] >= 3 && j[3] == 0) ||
            (j[0] >= 3 && j[1] >= 3 && j[2] == 0 && j[3] >= 3) ||
            (j[0] >= 3 && j[1] == 0 && j[2] >= 3 && j[3] >= 3) ||
            (j[0] == 0 && j[1] >= 3 && j[2] >= 3 && j[3] >= 3) {
            if yaku[37] != -1 {
                yaku[37] = 1
                yaku[73] = -1
            }
        }
    }

    
    
}
