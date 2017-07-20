//
//  Yaku48.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku48 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 13,イーソースートンシュン : 引数 kata1, men1, men2, men3, men4
    func isosutonshun(k1:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if yaku[13] != -1, k1 == 0, m1 == m2, m1 == m3, m1 == m4 {
            yaku[13] = 1
            yaku[22] = -1; yaku[23] = -1; yaku[64] = -1; yaku[69] = -1;
        }
    }
    
    // 14,イーソースーチェカオ : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func isosuchekao(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if k1 >= 1, k2 >= 1, k3 >= 1, k4 >= 1, m2[0] - m1[0] == 1, m3[0] - m2[0] == 1, m4[0] - m3[0] == 1 {
            if yaku[14] != -1 {
                yaku[14] = 1
                yaku[23] = -1; yaku[22] = -1; yaku[48] = -1
            }
        }
    }    
}
