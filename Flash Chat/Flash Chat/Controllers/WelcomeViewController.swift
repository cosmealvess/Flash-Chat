//
//  ViewController.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 3/7/2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var welcomeScreen:WelcomeScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeScreen?.delegate(delegate: self)
        welcomeScreen?.configTextFieldDelegate(delegate: self)
        
    }

    override func loadView() {
        self.welcomeScreen = WelcomeScreen()
        self.view = self.welcomeScreen
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension WelcomeViewController:WelcomeScreenProtocol{
    
    func registerButtonTapped() {
        
        let vc:RegisterViewController = RegisterViewController()
     self.navigationController?.pushViewController(vc, animated: true)
    }

    func loginButtonTapped() {
        let vc:ChatViewController = ChatViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension WelcomeViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextFieldBegin")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.loginScreen?.validaTextFields()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}



