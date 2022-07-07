//
//  Alert.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 4/7/2022.
//

import Foundation
import UIKit

class Alert: NSObject {
    
    var controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message:String, completion:(() -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel) { action in
            completion?()
        }
        
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true, completion: nil)
    }
}
