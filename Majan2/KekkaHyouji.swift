//
//  KekkaHyouji.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/19.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import UIKit

class KekkaHyouji: UIViewController {

    var str = [String]()
    @IBOutlet weak var mentsu1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var x:String = ""
        for i in str {
            x += (i + "\n")
        }
        print(x)
        mentsu1.text = x
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
