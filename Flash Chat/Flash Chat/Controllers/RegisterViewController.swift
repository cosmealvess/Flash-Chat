//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 3/7/2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    var alert:Alert?
    var auth: Auth?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextFieldDelegate(delegate: self)
        self.alert = Alert(controller: self)
        self.auth = Auth.auth()

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
    
    func RegisterButtonPressed() {
        
        let email: String = self.registerScreen?.emailTextField.text ?? ""
        let password: String = self.registerScreen?.passwordTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: password, completion: { authResult, error in
            
            if error != nil {
                self.alert?.getAlert(title: "Attention", message: "error when registering, please check the data and try again")
            } else {
                self.alert?.getAlert(title: "Congratulation", message: "user registered successfully", completion: {
                    
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
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
