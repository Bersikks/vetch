//
//  SignUpViewController.swift
//  Redi
//
//  Created by Berezhnova <3 on 05.02.2024.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var passConfirmLbl: UITextField!
    @IBOutlet weak var passLbl: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var NumberLbl: UITextField!
    @IBOutlet weak var mailLbl: UITextField!
    @IBOutlet weak var myCheck: UIButton!
    @IBOutlet weak var NameLbl: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLbl.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        NameLbl.layer.borderWidth = 1.0
        
        passConfirmLbl.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        passConfirmLbl.layer.borderWidth = 1.0
        
        passLbl.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        passLbl.layer.borderWidth = 1.0
        
        NumberLbl.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        NumberLbl.layer.borderWidth = 1.0
        
        mailLbl.layer.borderColor = UIColor(hex: 0xA7A7A7).cgColor
        mailLbl.layer.borderWidth = 1.0
        
        signUpBtn.isEnabled = false
        
        signUpBtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)
        
        NameLbl.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        passLbl.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        passConfirmLbl.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        mailLbl.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        NumberLbl.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func textChanged(_ textField: UITextField){
        checkEnableSignUpButton()
    }
    
    @IBAction func CheckBoxBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.frame = CGRect(x: myCheck.frame.origin.x, y: myCheck.frame.origin.y, width: 14, height: 14)
        checkEnableSignUpButton()
    }
    
    @IBAction func eyesBtnClick(_ sender: UIButton) {
        passLbl.isSecureTextEntry = !passLbl.isSecureTextEntry
    }
    
    @IBAction func eyesBtn2(_ sender: UIButton) {
        passConfirmLbl.isSecureTextEntry = !passConfirmLbl.isSecureTextEntry
    }
    
    
    private func checkEnableSignUpButton() {
    // Проверка условий для активации кнопки SignUp
        let isAllFieldsFilled = !NameLbl.text!.isEmpty &&
        !passLbl.text!.isEmpty &&
        !passConfirmLbl.text!.isEmpty &&
        !NumberLbl.text!.isEmpty &&
        !mailLbl.text!.isEmpty
        let isCheckBoxSelected = myCheck.isSelected

        // Активация/деактивация кнопки SignUp в зависимости от условий
        signUpBtn.isEnabled = isAllFieldsFilled && isCheckBoxSelected
        
        if signUpBtn.isEnabled {
            signUpBtn.backgroundColor = UIColor(hex: 0x0560FA)
        } else {
        // Можете настроить цвета для выключенного состояния
            signUpBtn.backgroundColor = UIColor(hex: 0xA7A7A7)
        }
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

}
