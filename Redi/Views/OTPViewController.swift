//
//  OTPViewController.swift
//  Redi
//
//  Created by Berezhnova <3 on 07.02.2024.
//

import UIKit

class OTPViewController: UIViewController {
    
    
    @IBOutlet weak var one: UITextField!
    @IBOutlet weak var six: UITextField!
    @IBOutlet weak var five: UITextField!
    @IBOutlet weak var four: UITextField!
    @IBOutlet weak var two: UITextField!
    @IBOutlet weak var setNewBtn: UIButton!
    @IBOutlet weak var three: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        one.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        one.layer.borderWidth = 1.0
        two.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        two.layer.borderWidth = 1.0
        three.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        three.layer.borderWidth = 1.0
        four.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        four.layer.borderWidth = 1.0
        five.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        five.layer.borderWidth = 1.0
        six.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        six.layer.borderWidth = 1.0
        
        setNewBtn.isEnabled = false
        setNewBtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        
        one.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        two.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        three.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        four.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        five.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        six.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
        CheckEnabled()
    }
    
    @objc func textChange(_ textField: UITextField){
        CheckEnabled()
    }
    
    private func CheckEnabled(){
        let isAllCheckSelected = !one.text!.isEmpty &&
        !two.text!.isEmpty &&
        !three.text!.isEmpty &&
        !four.text!.isEmpty &&
        !five.text!.isEmpty &&
        !six.text!.isEmpty
        
        setNewBtn.isEnabled = isAllCheckSelected
        
        
        if setNewBtn.isEnabled {
            setNewBtn.backgroundColor = UIColor(hex: 0x0560FA)
        } else {
            setNewBtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        }
        
        
        
        
    }
    
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

}
