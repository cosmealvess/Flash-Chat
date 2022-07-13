//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 4/7/2022.
//

import UIKit
import Firebase

protocol ChatViewControllerProtocol: AnyObject {
    func logOutButton()
}
class ChatViewController: UIViewController {
    
    var chatScreen:ChatScreen?
    var delegate:ChatViewControllerProtocol?
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "hey"),
        Message(sender: "a@2.com", body: "oi"),
        Message(sender: "b@2.com", body: "ai")
    ]
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatScreen?.configTableViewCells(delegate: self, dataSource: self)
        setupNavigationBar()

   
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Flash Chat"
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0/255, green: 203/255, blue: 214/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        
        let logOut = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(self.logOutPressed))
        logOut.tintColor = .black
        navigationItem.rightBarButtonItems = [logOut]
 
 
    }

    
    @objc func logOutPressed() {
        self.delegate?.logOutButton()
        
    }
    
    override func loadView() {
        self.chatScreen = ChatScreen()
        self.view = self.chatScreen
        
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatScreen?.messages.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = chatScreen?.messages[indexPath.row].body
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}



