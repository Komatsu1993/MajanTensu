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
    
    func check()->[Int] {
        var yaku = [Int](repeating:0, count:81)
        yaku[18] = 1
        
        // 88チェック
        let x88 = Yaku88(yaku: yaku)
        x88.ryuiso(a: all)
        yaku = x88.yaku
        
        // 64チェック
        let x64 = Yaku64(yaku: yaku)
        x64.chinyaochu(a: all)
        x64.tuiso(m: man, p: pin, s: sou)
        yaku = x64.yaku
        
        // 32チェック
        let x32 = Yaku32(yaku: yaku)
        x32.hunyaochu(m: man, p: pin, s: sou, j: ji)
        yaku = x32.yaku
        
        // 24チェック
        let x24 = Yaku24(yaku: yaku)
        x24.chinitu(m: man, p: pin, s: sou, j: ji)
        x24.chenta(a: all)
        x24.chenchun(a: all)
        x24.chenshao(a: all)
        yaku = x24.yaku
        
        // 12チェック
        let x12 = Yaku12(yaku: yaku)
        x12.shaoyu(a: all)
        x12.tayu(a: all)
        yaku = x12.yaku
        
        // 8チェック
        let x8 = Yaku8(yaku: yaku)
        x8.toiputao(a: all)
        yaku = x8.yaku
        
        // 6チェック
        let x6 = Yaku6(yaku: yaku)
        x6.huniso(m: man, p: pin, s: sou, j: ji)
        x6.umenchi(m: man, p: pin, s: sou, j: ji)
        yaku = x6.yaku
        
        // 4チェック
        let x4 = Yaku4(yaku: yaku)
        x4.puchuren(t: tumo, n: [false,false, false, false])
        yaku = x4.yaku
        
        // 2チェック
        let x2 = Yaku2(yaku: yaku)
        x2.tanyao(a: all)
        yaku = x2.yaku
        
        let setToitue: Set = [toi1, toi2, toi3, toi4, toi5, toi6, toi7]
        let x = 7 - setToitue.count
        yaku[64] += x
        
        // 1チェック
        let x1 = Yaku1(yaku: yaku)
        x1.uzu(j: ji)
        x1.cheimen(m: man, p: pin, s: sou)
        yaku = x1.yaku
        
        return yaku
    }
    
}
