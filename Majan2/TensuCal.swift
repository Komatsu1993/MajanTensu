//
//  TensuCal.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/19.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import UIKit

class TensuCal: UIViewController {
    
    var jikken = ""
    
    var mentsu1 = [Int]()
    var mentsu2 = [Int]()
    var mentsu3 = [Int]()
    var mentsu4 = [Int]()
    var head = -1
    
    var kata1 = -1, kata2 = -1, kata3 = -1, kata4 = -1
    
    var man = [Int](repeating:0, count:9)
    var pin = [Int](repeating:0, count:9)
    var sou = [Int](repeating:0, count:9)
    var ji = [Int](repeating:0, count:7)
    
    var all = [Int]()
    
    var naki = [Bool]()
    var tumo = false
    var ba = -1
    var ie = -1
    
    var yakumei = [String]()
    var yakumeis = [[String]]()

    @IBOutlet weak var men1: UITextField!
    @IBOutlet weak var men2: UITextField!
    @IBOutlet weak var men3: UITextField!
    @IBOutlet weak var men4: UITextField!
    @IBOutlet weak var men5: UITextField!
    
    
    @IBOutlet weak var kui1: UISwitch!
    @IBOutlet weak var kui2: UISwitch!
    @IBOutlet weak var kui3: UISwitch!
    @IBOutlet weak var kui4: UISwitch!
    
    @IBOutlet weak var agari: UISwitch!
    
    @IBOutlet weak var bakaze: UISegmentedControl!
    @IBOutlet weak var jikaze: UISegmentedControl!
    
    
    // 全ての処理をする
    @IBAction func shori(_ sender: Any) {
        print("呼び出し")
        yakumeis = [[String]]()
        
        // 面子１-４まで入れる
        mentsu1 = []
        let array1 = men1.text!.components(separatedBy: ",")
        for i in array1 {
            mentsu1.append(Int(i)!)
        }
        mentsu2 = []
        let array2 = men2.text!.components(separatedBy: ",")
        for i in array2 {
            mentsu2.append(Int(i)!)
        }
        mentsu3 = []
        let array3 = men3.text!.components(separatedBy: ",")
        for i in array3 {
            mentsu3.append(Int(i)!)
        }
        mentsu4 = []
        let array4 = men4.text!.components(separatedBy: ",")
        for i in array4 {
            mentsu4.append(Int(i)!)
        }
        head = Int(men5.text!)!
        
        // マンズ、ピンズ、ソウズ、ジパイに分ける
        man = [Int](repeating:0, count:9)
        pin = [Int](repeating:0, count:9)
        sou = [Int](repeating:0, count:9)
        ji = [Int](repeating:0, count:7)
        for i in mentsu1 {
            if i <= 8 {
                man[i] += 1
            } else if i <= 17 {
                pin[i - 9] += 1
            } else if i <= 26 {
                sou[i - 18] += 1
            } else {
                ji[i - 27] += 1
            }
        }
        for i in mentsu2 {
            if i <= 8 {
                man[i] += 1
            } else if i <= 17 {
                pin[i - 9] += 1
            } else if i <= 26 {
                sou[i - 18] += 1
            } else {
                ji[i - 27] += 1
            }
        }
        for i in mentsu3 {
            if i <= 8 {
                man[i] += 1
            } else if i <= 17 {
                pin[i - 9] += 1
            } else if i <= 26 {
                sou[i - 18] += 1
            } else {
                ji[i - 27] += 1
            }
        }
        for i in mentsu4 {
            if i <= 8 {
                man[i] += 1
            } else if i <= 17 {
                pin[i - 9] += 1
            } else if i <= 26 {
                sou[i - 18] += 1
            } else {
                ji[i - 27] += 1
            }
        }
        if head <= 8 {
            man[head] += 2
        } else if head <= 17 {
            pin[head - 9] += 2
        } else if head <= 26 {
            sou[head - 18] += 2
        } else {
            ji[head - 27] += 2
        }
        
        // all を作る
        all = man + pin + sou + ji
        
        // nakiを作る
        naki = [kui1.isOn, kui2.isOn, kui3.isOn, kui4.isOn]
        
        // tumoを作る
        tumo = agari.isOn
        
        // baを作る
        ba = bakaze.selectedSegmentIndex
        
        // ieを作る
        ie = jikaze.selectedSegmentIndex

        
        // 高点法の採用手順
        // 先頭に鳴きを詰めたBool型配列naki2とnakiMentsuを生成
        var naki2 = [false, false, false, false]
        var num = 0
        var nakiMentsu = [[Int]]()
        var all2 = all
        if kui1.isOn {
            nakiMentsu.append(mentsu1)
            naki2[num] = true
            num += 1
            for i in 0...mentsu1.count - 1 {
                all[mentsu1[i]] -= 1
            }
        }
        if kui2.isOn {
            nakiMentsu.append(mentsu2)
            naki2[num] = true
            num += 1
            for i in 0...mentsu2.count - 1 {
                all[mentsu2[i]] -= 1
            }
        }
        if kui3.isOn {
            nakiMentsu.append(mentsu3)
            naki2[num] = true
            num += 1
            for i in 0...mentsu3.count - 1 {
                all[mentsu3[i]] -= 1
            }
        }
        if kui4.isOn {
            nakiMentsu.append(mentsu4)
            naki2[num] = true
            num += 1
            for i in 0...mentsu4.count - 1 {
                all[mentsu4[i]] -= 1
            }
        }
        let test = AgariHantei(n: nakiMentsu)
        test.headSearch(a: all)
        let x = test.agari
        
        for i in 0...x.count - 1 {
            
            // 形の判別を行う
            if x[i][1][0] - x[i][1][1] != 0 {
                kata1 = 0
            } else {
                if x[i][1].count == 3 {
                    kata1 = 1
                } else {
                    kata1 = 2
                }
            }
            if x[i][2][0] - x[i][2][1] != 0 {
                kata2 = 0
            } else {
                if x[i][2].count == 3 {
                    kata2 = 1
                } else {
                    kata2 = 2
                }
            }
            if x[i][3][0] - x[i][3][1] != 0 {
                kata3 = 0
            } else {
                if x[i][3].count == 3 {
                    kata3 = 1
                } else {
                    kata3 = 2
                }
            }
            if x[i][4][0] - x[i][4][1] != 0 {
                kata4 = 0
            } else {
                if x[i][4].count == 3 {
                    kata4 = 1
                } else {
                    kata4 = 2
                }
                
                print("ここから")
                print(x[i][1])
                print(x[i][2])
                print(x[i][3])
                print(x[i][4])
                print(x[i][0][0])
                print(kata1)
                print(kata2)
                print(kata3)
                print(kata4)
                print(man)
                print(pin)
                print(sou)
                print(ji)
                print(all2)
                print(naki)
                print(tumo)
                print(ba)
                print(ie)
                print(yakumei)
                print("ここまで")
            }

            let check2 = CheckYaku(m1: x[i][1], m2: x[i][2], m3: x[i][3], m4: x[i][4], h: x[i][0][0], k1: kata1, k2: kata2, k3: kata3, k4: kata4, m: man, p: pin, s: sou, j: ji, a: all2, n: naki2, t: tumo, b: ba, i: ie)
            
            yakumeis.append(check2.henkan(yaku: check2.check()))
            
        }
        
    }
    
    @IBAction func search(_ sender: Any) {
        jikken = "ボタンが早い"
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
        if segue.identifier == "toKekka" {
//            let x = men1.text!
            let tes = segue.destination as! KekkaHyouji
            tes.str = yakumeis
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
