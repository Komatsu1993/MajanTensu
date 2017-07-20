//
//  Yaku1.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku1 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 69,イーパンカオ : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func ipankao(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if (k1 == 0 && m1 == m2) || (k2 == 0 && m2 == m3) || (k3 == 0 && m3 == m4) {
            if yaku[69] != -1 {
                yaku[69] = 1
            }
        }
    }
    
    
    // 70,シーシャンフォン : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func sishanfon(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if (k1 == 0 && k2 == 0 && m2[0] - m1[0] == 9) ||
            (k1 == 0 && k3 == 0 && m3[0] - m1[0] == 9) ||
            (k1 == 0 && k4 == 0 && m4[0] - m1[0] == 9) ||
            (k2 == 0 && k3 == 0 && m3[0] - m2[0] == 9) ||
            (k2 == 0 && k4 == 0 && m4[0] - m2[0] == 9) ||
            (k3 == 0 && k4 == 0 && m4[0] - m3[0] == 9) {
            if yaku[70] != -1 {
                yaku[70] = 1
            }
        }
    }
    
    // 71,レンリュー : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func renryu(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if (k1 == 0 && k2 == 0 && m2[0] - m1[0] == 3) ||
            (k1 == 0 && k3 == 0 && m3[0] - m1[0] == 3) ||
            (k1 == 0 && k4 == 0 && m4[0] - m1[0] == 3) ||
            (k2 == 0 && k3 == 0 && m3[0] - m2[0] == 3) ||
            (k2 == 0 && k4 == 0 && m4[0] - m2[0] == 3) ||
            (k3 == 0 && k4 == 0 && m4[0] - m3[0] == 3) {
            if yaku[71] != -1 {
                yaku[71] = 1
            }
        }
    }
    
    // 72,ラオシャオフー : 引数
    
    
    
}
