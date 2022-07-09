//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 4/7/2022.
//

import UIKit

class ChatViewController: UIViewController {
    
    var chatScreen:ChatScreen?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatScreen?.configTableViewCells(delegate: self, dataSource: self)
//        setup()
        
        
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


