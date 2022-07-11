//
//  ViewController.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 3/7/2022.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    var welcomeScreen:WelcomeScreen?
    var auth:Auth?
    var alert:Alert?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeScreen?.delegate(delegate: self)
        welcomeScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
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
        
        guard let login = self.welcomeScreen else {return}
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { authResult, error in
            
            if authResult == nil{
                self.alert?.getAlert(title: "Attention", message: "We had an unexpected problem, please try again later")
            }else{
                let vc = ChatTableViewController()
                let navVC = UINavigationController(rootViewController: vc)
                navVC.modalPresentationStyle = .fullScreen
                self.present(navVC, animated: true, completion: nil)
            }
        })
        
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



