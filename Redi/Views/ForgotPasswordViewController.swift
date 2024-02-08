//
//  ForgotPasswordViewController.swift
//  Redi
//
//  Created by Berezhnova <3 on 07.02.2024.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var mailLbl: UITextField!
    
    @IBOutlet weak var sendOTPbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailLbl.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        mailLbl.layer.borderWidth = 1.0

        sendOTPbtn.isEnabled = false
        sendOTPbtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)
        
        mailLbl.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
    checkEnabledBtn() // Проверка активации кнопки
    }
    
    private func checkEnabledBtn(){
        let isAllEnabled = !mailLbl.text!.isEmpty
        
        sendOTPbtn.isEnabled = isAllEnabled
        
        if sendOTPbtn.isEnabled {
            sendOTPbtn.backgroundColor = UIColor(hex: 0x0560FA)
        } else {
            sendOTPbtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        }
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

}


