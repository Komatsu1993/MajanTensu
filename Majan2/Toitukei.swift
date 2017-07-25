//
//  Toitukei.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/20.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import UIKit

class Toitukei: UIViewController {

    @IBOutlet weak var toitu1: UITextField!
    @IBOutlet weak var toitu2: UITextField!
    @IBOutlet weak var toitu3: UITextField!
    @IBOutlet weak var toitu4: UITextField!
    @IBOutlet weak var toitu5: UITextField!
    @IBOutlet weak var toitu6: UITextField!
    @IBOutlet weak var toitu7: UITextField!
    
    @IBOutlet weak var tumohu: UISwitch!
    
    // 各対子の中身
    var toi1 = -1, toi2 = -1, toi3 = -1, toi4 = -1, toi5 = -1, toi6 = -1, toi7 = -1
    
    // マンズ、ピンズ、ソウズ、ジパイで整理
    var man = [Int](repeating:0, count:9)
    var pin = [Int](repeating:0, count:9)
    var sou = [Int](repeating:0, count:9)
    var ji = [Int](repeating:0, count:7)
    
    // 全ての牌
    var all = [Int]()
    
    // ツモかどうか
    var tumo = false
    
    // 全役名
    var yakumei = [String]()
    
    
    
    @IBAction func kakunin(_ sender: Any) {
        toi1 = Int(toitu1.text!)!
        toi2 = Int(toitu2.text!)!
        toi3 = Int(toitu3.text!)!
        toi4 = Int(toitu4.text!)!
        toi5 = Int(toitu5.text!)!
        toi6 = Int(toitu6.text!)!
        toi7 = Int(toitu7.text!)!
        
        tumo = tumohu.isOn
        
        let kari = [toi1, toi2, toi3, toi4, toi5, toi6, toi7]
        for i in kari {
            if i <= 8 {
                man[i] += 2
            } else if i <= 17 {
                pin[i - 9] += 2
            } else if i <= 26 {
                sou[i - 18] += 2
            } else {
                ji[i - 27] += 2
            }
        }
        
        all = man + pin + sou + ji
        
        let agarikei = YakuToitu(t1: toi1, t2: toi2, t3: toi3, t4: toi4, t5: toi5, t6: toi6, t7: toi7, m: man, p: pin, s: sou, j: ji, a: all, t: tumo)
        let henkanKansu = CheckYaku(m1: [], m2: [], m3: [], m4: [], h: 0, k1: 0, k2: 0, k3: 0, k4: 0, m: [], p: [], s: [], j: [], a: [], n: [], n2: [[]], t: true, b: 0, i: 0, w: 0)
        yakumei = henkanKansu.henkan(yaku: agarikei.check())
        
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toToitu" {
            //            let x = men1.text!
            let tes = segue.destination as! ToituKekkahyouji
            tes.str = yakumei
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
