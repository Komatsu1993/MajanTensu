//
//  CheckYaku.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import Foundation

class CheckYaku {
    
    // 各面子の中身
    var men1 = [Int]()
    var men2 = [Int]()
    var men3 = [Int]()
    var men4 = [Int]()
    var head = -1
    
    // 各面子の形, 0:シュンツ 1:コウツ 2:カンツ
    var kata1 = -1, kata2 = -1, kata3 = -1, kata4 = -1
    
    // マンズ、ピンズ、ソウズ、ジパイの中身
    var man = [Int]()
    var pin = [Int]()
    var sou = [Int]()
    var ji = [Int]()
    
    var all = [Int]()   // 全ての牌の中身
    var naki = [Bool]() // 各面子が鳴いているかどうか true:鳴き false:門前
    var tumo = false    // ツモ上がりかどうか true:ツモ false:ロン
    var ba = -1         // 場風 0:東 1:南 2:西 3:北
    var ie = -1         // 自風 0:東 1:南 2:西 3:北
    
    var yaku = [Int](repeating:0, count:81)
    
    // 初期化
    init(m1:[Int], m2:[Int], m3:[Int], m4:[Int], h:Int, k1:Int, k2:Int, k3:Int, k4:Int, m:[Int], p:[Int], s:[Int], j:[Int], a:[Int], n:[Bool], t:Bool, b:Int, i:Int) {
        self.men1 = m1; self.men2 = m2; self.men3 = m3; self.men4 = m4;
        self.head = h
        self.kata1 = k1; self.kata2 = k2; self.kata3 = k3; self.kata4 = k4;
        self.man = m; self.pin = p; self.sou = s; self.ji = j;
        self.all = a; self.naki = n; self.tumo = t; self.ba = b; self.ie = i
    }
    
    // チェック関数 : 上がり役を数値配列で返す
    func check()->[Int] {
        var yaku = [Int](repeating:0, count:81)
        
        // 88点チェック
        let x88 = Yaku88(yaku: yaku)
        x88.tasusi(j: ji)
        x88.daisangen(j: ji)
        x88.ryuiso(a: all)
        x88.sukan(k1: kata1, k2: kata2, k3: kata3, k4: kata4)
        yaku = x88.yaku
        
        // 64点チェック
        let x64 = Yaku64(yaku: yaku)
        x64.chinyaochu(a: all)
        x64.shosusi(j: ji)
        x64.shosangen(j: ji)
        x64.tuiso(m: man, p: pin, s: sou)
        x64.suanku(k1: kata1, k2: kata2, k3: kata3, k4: kata4, n: naki)
        x64.isoshanronfi(m: man, p: pin, s: sou)
        yaku = x64.yaku
        
        // 48点チェック
        let x48 = Yaku48(yaku: yaku)
        x48.isosutonshun(k1: kata1, m1: men1, m2: men2, m3: men3, m4: men4)
        x48.isosuchekao(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        yaku = x48.yaku
        
        // 32点チェック
        let x32 = Yaku32(yaku: yaku)
        x32.isosupukao(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x32.sankan(k1: kata1, k2: kata2, k3: kata3, k4: kata4)
        x32.hunyaochu(m: man, p: pin, s: sou, j: ji)
        yaku = x32.yaku
        
        // 24点チェック
        let x24 = Yaku24(yaku: yaku)
        x24.chenshanku(k1: kata1, k2: kata2, k3: kata3, k4: kata4, a: all)
        x24.chinitu(m: man, p: pin, s: sou, j: ji)
        x24.isosantonshun(k1: kata1, k2: kata2, m1: men1, m2: men2, m3: men3, m4: men4)
        x24.isosanchekao(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x24.chenta(a: all)
        x24.chenchun(a: all)
        x24.chenshao(a: all)
        yaku = x24.yaku
        
        // 16点チェック
        let x16 = Yaku16(yaku: yaku)
        x16.chinron(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x16.sansoshanronfi(m1: men1, m2: men2, m3: men3, m4: men4)
        x16.isosanpukao(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x16.chentaiu(m1: men1, m2: men2, m3: men3, m4: men4, h: head)
        x16.santonku(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x16.sananku(k1: kata1, k2: kata2, k3: kata3, k4: kata4, n: naki)
        yaku = x16.yaku
        
        // 12点チェック
        let x12 = Yaku12(yaku: yaku)
        x12.tayu(a: all)
        x12.shaoyu(a: all)
        x12.sanfonku(j: ji)
        yaku = x12.yaku
        
        // 8点チェック
        let x8 = Yaku8(yaku: yaku)
        x8.faron(m1: men1, m2: men2, m3: men3, m4: men4)
        x8.toiputao(a: all)
        x8.sansosantonshun(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x8.sansosanchekao(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x8.shanankan(k1: kata1, k2: kata2, k3: kata3, k4: kata4, n: naki)
        yaku = x8.yaku
        
        // 6点チェック
        let x6 = Yaku6(yaku: yaku)
        x6.ponponhu(k1: kata1, k2: kata2, k3: kata3, k4: kata4)
        x6.huniso(m: man, p: pin, s: sou, j: ji)
        x6.sansosanpukao(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x6.umenchi(m: man, p: pin, s: sou, j: ji)
        x6.chenchuren(n: naki)
        x6.shanchenku(j: ji)
        x6.shankan(k1: kata1, k2: kata2, k3: kata3, k4: kata4, n: naki)
        yaku = x6.yaku
        
        // 4点チェック
        let x4 = Yaku4(yaku: yaku)
        x4.chentaiyao(m1: men1, m2: men2, m3: men3, m4: men4, h: head)
        x4.puchuren(t: tumo, n: naki)
        x4.shanminkan(k1: kata1, k2: kata2, k3: kata3, k4: kata4, n: naki)
        yaku = x4.yaku
        
        // 2点チェック
        let x2 = Yaku2(yaku: yaku)
        x2.chenku(j: ji)
        x2.chenfonku(b: ba, j: ji)
        x2.menfonku(i: ie, j: ji)
        x2.menzenchin(n: naki, t: tumo)
        x2.pinhu(k1: kata1, k2: kata2, k3: kata3, k4: kata4, h: head)
        x2.sukui(k1: kata1, k2: kata2, k3: kata3, k4: kata4, a: all)
        x2.shantonku(k1: kata1, k2: kata2, k3: kata3, k4: kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x2.shananku(k1: kata1, k2: kata2, k3: kata3, k4: kata4, n: naki)
        x2.ankan(k1: kata1, k2: kata2, k3: kata3, k4: kata4, n: naki)
        x2.tanyao(a: all)
        yaku = x2.yaku
        
        // 1点チェック
        let x1 = Yaku1(yaku: yaku)
        x1.ipankao(k1: kata1, k2: kata2, k3: kata3, k4:kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x1.sishanfon(k1: kata1, k2: kata2, k3: kata3, k4:kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        x1.renryu(k1: kata1, k2: kata2, k3: kata3, k4:kata4, m1: men1, m2: men2, m3: men3, m4: men4)
        yaku = x1.yaku
        
        
        print(yaku)
        return yaku
    }
    
    // 上がり役の数値を文字に変換する関数
    func henkan(yaku:[Int])->[String] {
        var yaku = yaku
        var yakuStr = [String]()
        
        for i in 0...80 {
            while(yaku[i] > 0) {
                switch i {
                case 0 : yakuStr.append("大四喜")
                case 1 : yakuStr.append("大三元")
                case 2 : yakuStr.append("緑一色")
                case 3 : yakuStr.append("九連宝燈")
                case 4 : yakuStr.append("四槓")
                case 5 : yakuStr.append("連七対")
                case 6 : yakuStr.append("十三幺")
                case 7 : yakuStr.append("清幺九")
                case 8 : yakuStr.append("小四喜")
                case 9 : yakuStr.append("小三元")
                case 10 : yakuStr.append("字一色")
                case 11 : yakuStr.append("四暗刻")
                case 12 : yakuStr.append("一色双龍会")
                case 13 : yakuStr.append("一色四同順")
                case 14 : yakuStr.append("一色四節高")
                case 15 : yakuStr.append("一色四歩高")
                case 16 : yakuStr.append("三槓")
                case 17 : yakuStr.append("混幺九")
                case 18 : yakuStr.append("七対")
                case 19 : yakuStr.append("七星不靠")
                case 20 : yakuStr.append("全双刻")
                case 21 : yakuStr.append("清一色")
                case 22 : yakuStr.append("一色三同順")
                case 23 : yakuStr.append("一色三節高")
                case 24 : yakuStr.append("全大")
                case 25 : yakuStr.append("全中")
                case 26 : yakuStr.append("全小")
                case 27 : yakuStr.append("清龍")
                case 28 : yakuStr.append("三色双龍会")
                case 29 : yakuStr.append("一色三歩高")
                case 30 : yakuStr.append("全帯五")
                case 31 : yakuStr.append("三同刻")
                case 32 : yakuStr.append("三暗刻")
                case 33 : yakuStr.append("全不靠")
                case 34 : yakuStr.append("組合龍")
                case 35 : yakuStr.append("大于五")
                case 36 : yakuStr.append("小于五")
                case 37 : yakuStr.append("三風刻")
                case 38 : yakuStr.append("花龍")
                case 39 : yakuStr.append("推不倒")
                case 40 : yakuStr.append("三色三同順")
                case 41 : yakuStr.append("三色三節高")
                case 42 : yakuStr.append("無番和")
                case 43 : yakuStr.append("妙手回春")
                case 44 : yakuStr.append("海底撈月")
                case 45 : yakuStr.append("槓上開花")
                case 46 : yakuStr.append("搶槓和")
                case 47 : yakuStr.append("双暗槓")
                case 48 : yakuStr.append("碰碰和")
                case 49 : yakuStr.append("混一色")
                case 50 : yakuStr.append("三色三歩高")
                case 51 : yakuStr.append("五門斉")
                case 52 : yakuStr.append("全求人")
                case 53 : yakuStr.append("双箭刻")
                case 54 : yakuStr.append("双槓")
                case 55 : yakuStr.append("全帯幺")
                case 56 : yakuStr.append("不求人")
                case 57 : yakuStr.append("暗明槓")
                case 58 : yakuStr.append("和絶張")
                case 59 : yakuStr.append("箭刻")
                case 60 : yakuStr.append("圏風刻")
                case 61 : yakuStr.append("門風刻")
                case 62 : yakuStr.append("門前清")
                case 63 : yakuStr.append("平和")
                case 64 : yakuStr.append("四帰一")
                case 65 : yakuStr.append("双同刻")
                case 66 : yakuStr.append("双暗刻")
                case 67 : yakuStr.append("暗槓")
                case 68 : yakuStr.append("断幺")
                case 69 : yakuStr.append("一般高")
                case 70 : yakuStr.append("喜相逢")
                case 71 : yakuStr.append("連六")
                case 72 : yakuStr.append("老少副")
                case 73 : yakuStr.append("幺九刻")
                case 74 : yakuStr.append("明槓")
                case 75 : yakuStr.append("絶一門")
                case 76 : yakuStr.append("無字")
                case 77 : yakuStr.append("辺張")
                case 78 : yakuStr.append("坎張")
                case 79 : yakuStr.append("単調将")
                case 80 : yakuStr.append("自摸")
                default : print("default")
                }
                yaku[i] -= 1
            }
        }
        
        return yakuStr
    }
    
}
