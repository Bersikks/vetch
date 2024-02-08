//
//  SignInViewController.swift
//  Redi
//
//  Created by Berezhnova <3 on 06.02.2024.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var passLblSignIn: UITextField!
    @IBOutlet weak var LogInBtn: UIButton!
    @IBOutlet weak var mailLblLogIn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passLblSignIn.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        passLblSignIn.layer.borderWidth = 1.0
        
        mailLblLogIn.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        mailLblLogIn.layer.borderWidth = 1.0
        
        LogInBtn.isEnabled = false
        LogInBtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)
        
        passLblSignIn.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        mailLblLogIn.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)

        
        
    }
    
    @objc func textChanged(_ textField: UITextField){
        checkEnableLogIn()
    }
    
    @IBAction func eyesBtn3Chancg(_ sender: UIButton) {
        passLblSignIn.isSecureTextEntry = !passLblSignIn.isSecureTextEntry
    }
    
    private func checkEnableLogIn(){
        let isAllEnabledBtn = !mailLblLogIn.text!.isEmpty &&
        !passLblSignIn.text!.isEmpty
        
        LogInBtn.isEnabled = isAllEnabledBtn
        
        if LogInBtn.isEnabled {
            LogInBtn.backgroundColor = UIColor(hex: 0x0560FA)
        } else {
        // Можете настроить цвета для выключенного состояния
            LogInBtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        }
        
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

}
