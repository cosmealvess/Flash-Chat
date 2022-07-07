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
        
        
    }
    
    override func loadView() {
        self.chatScreen = ChatScreen()
        self.view = self.chatScreen
        
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let color:[UIColor] = [.orange, .red, .green, .blue]
        let cell: UITableViewCell = UITableViewCell()
        cell.backgroundColor = color[indexPath.row]
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "\(indexPath.row)"
//        cell.textLabel?.textColor = .black
//        cell.backgroundColor = .white
        return cell
    }
    
    
}


