//
//  Yaku16.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class Yaku16 {
    
    var yaku = [Int]()
    
    init(yaku:[Int]) {
        self.yaku = yaku
    }
    
    // 27,チンロン : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func chinron(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        let check1 = m1 + m2 + m3
        let check2 = m1 + m2 + m4
        let check3 = m1 + m3 + m4
        let check4 = m2 + m3 + m4
        let area1 = [0,1,2,3,4,5,6,7,8]   // マンズのチンロン
        let area2 = [9,10,11,12,13,14,15,16,17]  // ピンズのチンロン
        let area3 = [18,19,20,21,22,23,24,25,26] // ソウズのチンロン
        
        if check1 == area1 || check2 == area1 || check3 == area1 || check4 == area1 ||
            check1 == area2 || check2 == area2 || check3 == area2 || check4 == area2 ||
            check1 == area3 || check2 == area3 || check3 == area3 || check4 == area3 {
            if yaku[27] != -1 {
                yaku[27] = 1
                yaku[71] = -1; yaku[72] = -1
            }
        }
    }
    
    // 28,サンソーシャンロンフィ : 引数 men1, men2, men3, men4
    func sansoshanronfi(m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        let area1 = [0,1,2,6,7,8,9,10,11,15,16,17]  // ソウズがヘッドの場合
        let area2 = [0,1,2,6,7,8,18,19,20,24,25,26] // ピンズがヘッドの場合
        let area3 = [9,10,11,15,16,17,18,19,20,24,25,26]  // マンズがヘッドの場合
        let check = m1 + m2 + m3 + m4
        if check == area1 || check == area2 || check == area3 {
            if yaku[28] != -1 {
                yaku[28] = 1
                yaku[63] = -1; yaku[70] = -1; yaku[72] = -1; yaku[76] = -1;
            }
        }
    }
    
    // 29,イーソーサンプカオ : 引数 kata1, kata2, kata3, kata4 ,men1, men2, men3, men4
    func isosanpukao(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if (k1 == 0 && k2 == 0 && k3 == 0 && m2[0] - m1[0] == 1 && m3[0] - m2[0] == 1) ||
            (k1 == 0 && k2 == 0 && k3 == 0 && m2[0] - m1[0] == 2 && m3[0] - m2[0] == 2) ||
            (k1 == 0 && k2 == 0 && k4 == 0 && m2[0] - m1[0] == 1 && m4[0] - m2[0] == 1) ||
            (k1 == 0 && k2 == 0 && k4 == 0 && m2[0] - m1[0] == 2 && m4[0] - m2[0] == 2) ||
            (k1 == 0 && k3 == 0 && k4 == 0 && m3[0] - m1[0] == 1 && m4[0] - m3[0] == 1) ||
            (k1 == 0 && k3 == 0 && k4 == 0 && m3[0] - m1[0] == 2 && m4[0] - m3[0] == 2) ||
            (k2 == 0 && k3 == 0 && k4 == 0 && m3[0] - m2[0] == 1 && m4[0] - m3[0] == 1) ||
            (k2 == 0 && k3 == 0 && k4 == 0 && m3[0] - m2[0] == 2 && m4[0] - m3[0] == 2) {
            if yaku[29] != -1 {
                yaku[29] = 1
            }
        }
    }
    
    // 30,チェンタイウー : 引数 men1, men2, men3, men4, head
    func chentaiu(m1:[Int], m2:[Int], m3:[Int], m4:[Int], h:Int)->() {
        let check = [m1, m2, m3, m4]
        var x = 0
        for i in check {
            if i[0] != 4, i[0] != 13, i[0] != 22, i[1] != 4 ,i[1] != 13, i[1] != 22, i[2] != 4, i[2] != 13, i[2] != 22, i[3] != 4, i[3] != 13, i[3] != 22 {
                x += 1
            }
        }
        if x == 0 && yaku[30] != -1 && (h == 4 || h == 13 || h == 22) {
            yaku[30] = 1
            yaku[68] = -1
        }
    }
    
    // 31,サントンク : 引数 kata1, kata2, kata3, kata4, men1, men2, men3, men4
    func santonku(k1:Int, k2:Int, k3:Int, k4:Int, m1:[Int], m2:[Int], m3:[Int], m4:[Int])->() {
        if (k1 >= 1 && k2 >= 1 && k3 >= 1 && m2[0] - m1[0] == 9 && m3[0] - m2[0] == 9) ||
            (k1 >= 1 && k2 >= 1 && k4 >= 1 && m2[0] - m1[0] == 9 && m4[0] - m2[0] == 9) ||
            (k1 >= 1 && k3 >= 1 && k4 >= 1 && m3[0] - m1[0] == 9 && m4[0] - m3[0] == 9) ||
            (k2 >= 1 && k3 >= 1 && k4 >= 1 && m3[0] - m2[0] == 9 && m4[0] - m3[0] == 9) {
            if yaku[31] != -1 {
                yaku[31] = 1
                yaku[65] = -1
            }
        }
    }
    
    // 32,サンアンク : 引数 kata1, kata2, kata3, naki
    func sananku(k1:Int, k2:Int, k3:Int, k4:Int, n:[Bool])->() {
        if (k1 >= 1 && k2 >= 1 && k3 >= 1 && !n[0] && !n[1] && !n[2]) ||
            (k1 >= 1 && k2 >= 1 && k4 >= 1 && !n[0] && !n[1] && !n[3]) ||
            (k1 >= 1 && k3 >= 1 && k4 >= 1 && !n[0] && !n[2] && !n[3]) ||
            (k2 >= 1 && k3 >= 1 && k4 >= 1 && !n[1] && !n[2] && !n[3]) {
            if yaku[32] != -1 {
                yaku[32] = 1
                yaku[66] = -1
            }
        }
    }
}
