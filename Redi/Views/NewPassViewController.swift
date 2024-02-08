//
//  NewPassViewController.swift
//  Redi
//
//  Created by Berezhnova <3 on 08.02.2024.
//

import UIKit

class NewPassViewController: UIViewController {

    @IBOutlet weak var pass2: UITextField!
    @IBOutlet weak var pass1: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pass1.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        pass2.layer.borderColor = UIColor(hex: 0x0560FA).cgColor
        pass1.layer.borderWidth = 1.0
        pass2.layer.borderWidth = 1.0
        
        loginBtn.isEnabled = false
        loginBtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        
        pass1.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        
        pass2.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)

        CheckEnabled()
        
    }
    
    @objc func checkText(_ textfield: UITextField ){
        CheckEnabled()
    }
    
    
    @IBAction func eye2(_ sender: UIButton) {
        pass1.isSecureTextEntry = !pass1.isSecureTextEntry
    }
    @IBAction func eye1(_ sender: UIButton) {
        pass2.isSecureTextEntry = !pass2.isSecureTextEntry
    }
    
    private func CheckEnabled(){
        let isAllChecked = !pass1.text!.isEmpty &&
        !pass2.text!.isEmpty
        
        loginBtn.isEnabled = isAllChecked
        
        if loginBtn.isEnabled {
            loginBtn.backgroundColor = UIColor(hex: 0x0560FA)
        } else {
            loginBtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        }
        
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}
