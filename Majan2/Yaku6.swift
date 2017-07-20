//
//  Yaku6.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku6 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    
    // 48,ポンポンフー : 引数 kata1, kata2, kata3, kata4
    func ponponhu(k1:Int, k2:Int, k3:Int, k4:Int)->() {
        if k1 >= 1, k2 >= 1, k3 >= 1, k4 >= 1, yaku[48] != -1 {
            yaku[48] = 1
        }
    }
    
    // 49,フンイーソー : 引数 man, pin, sou, ji
    func huniso(m:[Int], p:[Int], s:[Int], j:[Int])->() {
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
        if (x != 0 && y == 0 && z == 0 && w != 0) || (x == 0 && y != 0 && z == 0 && w != 0) || (x == 0 && y == 0 && z != 0 && w != 0) {
            if yaku[49] != -1 {
                yaku[49] = 1
            }
        }
    }
    
    // 50,サンソーサンプカオ : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4  sansosanchekao21を使う
    func sansosanpukao(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        var x = false
        if k1 == 0, k2 == 0, k3 == 0 {
            x = sansosanchekao2(m1: m1, m2: m2, m3: m3)
        }
        if k1 == 0, k2 == 0, k4 == 0, !x {
            x = sansosanchekao2(m1: m1, m2: m2, m3: m4)
        }
        if k1 == 0, k3 == 0, k4 == 0, !x {
            x = sansosanchekao2(m1: m1, m2: m3, m3: m4)
        }
        if k2 == 0, k3 == 0, k4 == 0, !x {
            x = sansosanchekao2(m1: m2, m2: m3, m3: m4)
        }
        if x, yaku[50] != -1 {
            yaku[50] = 1
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
    
    // 51,ウーメンチー : 引数 man, pin, sou, ji
    func umenchi(m:[Int], p:[Int], s:[Int], j:[Int])->() {
        var n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0
        for i in m {
            n1 += i
        }
        for i in p {
            n2 += i
        }
        for i in s {
            n3 += i
        }
        for i in 0...3 {
            n4 += j[i]
        }
        for i in 4...6 {
            n5 += j[i]
        }
        if yaku[51] != -1, n1 != 0, n2 != 0, n3 != 0, n4 != 0, n5 != 0 {
            yaku[51] = 1
        }
    }
    
    // 52,チェンチューレン : 引数 naki
    func chenchuren(n:[Bool])->() {
        if yaku[52] != -1, n[0], n[1], n[2], n[3] {
            yaku[52] = 1
            yaku[79] = -1
        }
    }
    
    // 53,シャンチェンク : 引数 ji
    func shanchenku(j:[Int])->() {
        if(j[4] >= 3 && j[5] >= 3 && j[6] == 0) ||
            (j[4] >= 3 && j[5] == 0 && j[6] >= 3) ||
            (j[4] == 0 && j[5] >= 3 && j[6] >= 3) {
            if yaku[53] != -1 {
                yaku[53] = 1
                yaku[59] = -1
            }
        }
    }
    
    // 54,シャンカン : 引数 kata1, kata2, kata3, kata4, naki
    func shankan(k1:Int, k2:Int, k3:Int, k4:Int, n:[Bool])->() {
        if (k1 == 2 && k2 == 2 && !n[0] && n[1]) || (k1 == 2 && k3 == 2 && !n[0] && n[2]) ||
            (k1 == 2 && k4 == 2 && !n[0] && n[3]) || (k2 == 2 && k3 == 2 && !n[1] && n[2]) ||
            (k2 == 2 && k4 == 2 && !n[1] && n[3]) || (k3 == 2 && k4 == 2 && !n[2] && n[3]) ||
            (k1 == 2 && k2 == 2 && n[0] && !n[1]) || (k1 == 2 && k3 == 2 && n[0] && !n[2]) ||
            (k1 == 2 && k4 == 2 && n[0] && !n[3]) || (k2 == 2 && k3 == 2 && n[1] && !n[2]) ||
            (k2 == 2 && k4 == 2 && n[1] && !n[3]) || (k3 == 2 && k4 == 2 && n[2] && !n[3]) {
            if yaku[54] != -1 {
                yaku[54] = 1
                yaku[67] = -1; yaku[74] = -1;
            }
        }
    }
    
}
