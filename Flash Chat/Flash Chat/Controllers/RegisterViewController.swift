//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 3/7/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    var alert:Alert?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextFieldDelegate(delegate: self)
        self.alert = Alert(controller: self)

    }
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

}

extension RegisterViewController:RegisterScreenProtocol{
    func actionButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.loginScreen?.validaTextFields()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
