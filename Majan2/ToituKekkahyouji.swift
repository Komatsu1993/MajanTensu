//
//  ToituKekkahyouji.swift
//  Majan2
//
//  Created by 小松知樹 on 2017/07/21.
//  Copyright © 2017年 Komatsu. All rights reserved.
//

import UIKit

class ToituKekkahyouji: UIViewController {

    @IBOutlet weak var Hyouji: UILabel!
    
    var str = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var lab = ""
        for i in str {
            lab += i + "\n"
        }
        Hyouji.text = lab
        // Do any additional setup after loading the view.
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
