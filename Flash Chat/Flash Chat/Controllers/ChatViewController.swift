//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 4/7/2022.
//

import UIKit

class ChatViewController: UIViewController {
    
    var chatScreen:ChatScreen?
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "hey"),
        Message(sender: "a@2.com", body: "oi"),
        Message(sender: "b@2.com", body: "ai")
    ]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatScreen?.configTableViewCells(delegate: self, dataSource: self)
        
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



