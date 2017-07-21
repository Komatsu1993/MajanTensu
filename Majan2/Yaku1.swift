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
        if yaku[69] != -1 {
            if k1 == 0, m1 == m2 { yaku[69] += 1 }
            if k2 == 0, m2 == m3 { yaku[69] += 1 }
            if k3 == 0, m3 == m4 { yaku[69] += 1 }
        }
    }
    
    
    // 70,シーシャンフォン : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func sishanfon(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if yaku[70] != -1 {
            if (k1 == 0 && k2 == 0 && m2[0] - m1[0] == 9) { yaku[70] += 1 }
            if (k1 == 0 && k3 == 0 && m3[0] - m1[0] == 9) { yaku[70] += 1 }
            if (k1 == 0 && k4 == 0 && m4[0] - m1[0] == 9) { yaku[70] += 1 }
            if (k2 == 0 && k3 == 0 && m3[0] - m2[0] == 9) { yaku[70] += 1 }
            if (k2 == 0 && k4 == 0 && m4[0] - m2[0] == 9) { yaku[70] += 1 }
            if (k3 == 0 && k4 == 0 && m4[0] - m3[0] == 9) { yaku[70] += 1 }
        }
    }
    
    // 71,レンリュー : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func renryu(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if yaku[71] != -1 {
            if (k1 == 0 && k2 == 0 && m2[0] - m1[0] == 3) { yaku[71] += 1 }
            if (k1 == 0 && k3 == 0 && m3[0] - m1[0] == 3) { yaku[71] += 1 }
            if (k1 == 0 && k4 == 0 && m4[0] - m1[0] == 3) { yaku[71] += 1 }
            if (k2 == 0 && k3 == 0 && m3[0] - m2[0] == 3) { yaku[71] += 1 }
            if (k2 == 0 && k4 == 0 && m4[0] - m2[0] == 3) { yaku[71] += 1 }
            if (k3 == 0 && k4 == 0 && m4[0] - m3[0] == 3) { yaku[71] += 1 }
        }
    }
    
    // 72,ラオシャオフー : 引数 men1, men2, men3, men4
    func raoshaohu(m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        let x1 = m1 + m2, x2 = m1 + m3, x3 = m1 + m4, x4 = m2 + m3, x5 = m2 + m4, x6 = m3 + m4
        if yaku[72] != -1 {
            if raoshahu2(m: x1) { yaku[72] += 1 }
            if raoshahu2(m: x2) { yaku[72] += 1 }
            if raoshahu2(m: x3) { yaku[72] += 1 }
            if raoshahu2(m: x4) { yaku[72] += 1 }
            if raoshahu2(m: x5) { yaku[72] += 1 }
            if raoshahu2(m: x6) { yaku[72] += 1 }
        }
    }
    
    // 72-2 ２面子を合わせた配列を引数に取り、ラオシャーフを作るか判別する
    func raoshahu2(m:[Int])->Bool {
        if m == [0,1,2,6,7,8] || m == [9,10,11,15,16,17] || m == [18,19,20,24,25,26] {
            return true
        } else {
            return false
        }
    }
    
    // 73,ヤオチューク : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func yaochuku(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if yaku[73] != -1 {
            if k1 >= 1 {
                if yaochuku2(m: m1) {
                    yaku[73] += 1
                }
            }
            if k2 >= 1 {
                if yaochuku2(m: m2) {
                    yaku[73] += 1
                }
            }
            if k3 >= 1 {
                if yaochuku2(m: m3) {
                    yaku[73] += 1
                }
            }
            if k4 >= 1 {
                if yaochuku2(m: m4) {
                    yaku[73] += 1
                }
            }
        }
    }
    
    // 73-2, コーツを引数にとって、ヤオチュークか判別する
    func yaochuku2(m:[Int])->Bool {
        if m[0] == 0 || m[0] == 8 || m[0] == 9 || m[0] == 17 || m[0] == 18 || m[0] == 26 || m[0] == 27 || m[0] == 28 || m[0] == 29 || m[0] == 30 || m[0] == 31 || m[0] == 32 || m[0] == 33 {
            return true
        } else {
            return false
        }
    }
    
    // 74,ミンカン : 引数 kata1, kata2, kata3, kata4, naki
    func minkan(k1:Int, k2:Int, k3:Int, k4:Int, n:[Bool])->() {
        if (k1 == 2 && n[0]) || (k2 == 2 && n[1]) || (k3 == 2 && n[2]) || (k4 == 2 && n[3]) {
            if yaku[74] != -1 {
                yaku[74] = 1
            }
        }
    }
    
    // 75,チェイーメン : 引数 man, pin, sou
    func cheimen(m:[Int], p:[Int], s:[Int])->() {
        var x = 0, y = 0, z = 0
        for i in m {
            x += i
        }
        for i in p {
            y += i
        }
        for i in s {
            z += i
        }
        if (x == 0 && y != 0 && z != 0) || (x != 0 && y == 0 && z != 0) || (x != 0 && y != 0 && z == 0) {
            if yaku[75] != -1 {
                yaku[75] = 1
            }
        }
    }
    
    // 76,ウーズ : 引数 ji
    func uzu(j:[Int])->() {
        var x = 0
        for i in j {
            x += i
        }
        if x == 0, yaku[76] != -1 {
            yaku[76] = 1
        }
    }
    
    // 77,ペンチャン : 引数
    
    // 78,カンチャン : 引数
    
    // 79,タンキ : 引数
    
    // 80,ツモ : 引数 tumo
    func tumoagari(t:Bool)->() {
        if t, yaku[80] != -1 {
            yaku[80] = 1
        }
    }
    
    
}
