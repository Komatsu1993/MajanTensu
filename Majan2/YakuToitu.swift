//
//  YakuToitu.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation


class YakuToitu {
    
    // 緑一色, レンチートイ, ちんヤオチュー, 字一色, ふんヤオチュー, チートイ, チンイツ, 全大, 全中, 全小, たーゆーう, 小宇う, トイプタオ, 
    // 廃帝とか, フンイーソー, ウーメンチー, プチューレン, スークーイー, タンヤオ, チェイーメン, うーず, 
    
    var toi1 = -1, toi2 = -1, toi3 = -1, toi4 = -1, toi5 = -1, toi6 = -1, toi7 = -1
    
    var man = [Int]()
    var pin = [Int]()
    var sou = [Int]()
    var ji = [Int]()
    
    var all = [Int]()
    
    var tumo = false
    
    init(t1:Int, t2:Int, t3:Int, t4:Int, t5:Int, t6:Int, t7:Int, m:[Int], p:[Int], s:[Int], j:[Int], a:[Int], t:Bool) {
        self.toi1 = t1
        self.toi2 = t2
        self.toi3 = t3
        self.toi4 = t4
        self.toi5 = t5
        self.toi6 = t6
        self.toi7 = t7
        self.man = m
        self.pin = p
        self.sou = s
        self.ji = j
        self.all = a
        self.tumo = t
    }
    
    func check()->() {
        var yaku = [Int](repeating:0, count:81)
        yaku[18] = 1
        
        // 88チェック
        let x88 = Yaku88(yaku: yaku)
        x88.ryuiso(a: all)
        yaku = x88.yaku
        
        // 64チェック
    }
    
}
