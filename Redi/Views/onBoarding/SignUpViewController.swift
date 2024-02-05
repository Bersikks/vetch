//
//  SignUpViewController.swift
//  Redi
//
//  Created by Berezhnova <3 on 05.02.2024.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var myCheck: UIButton!
    @IBOutlet weak var NameLbl: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLbl.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        NameLbl.layer.borderWidth = 1.0
        // Do any additional setup after loading the view.
    }
    @IBAction func CheckBoxBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            sender.frame = CGRect(x: myCheck.frame.origin.x, y: myCheck.frame.origin.y, width: 14, height: 14)
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
