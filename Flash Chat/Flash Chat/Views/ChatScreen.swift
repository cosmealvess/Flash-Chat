//
//  ChatScreen.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 4/7/2022.
//

import UIKit

class ChatScreen: UIView {
 
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "hey"),
        Message(sender: "a@2.com", body: "oi"),
        Message(sender: "b@2.com", body: "ai")
    ]
    
    lazy var messageTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.autocapitalizationType = .words
        tf.placeholder = "Write a message:"
        tf.autocapitalizationType = .words
        tf.textColor = .darkGray
        return tf
        
    }()
    
    lazy var messageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "sendMessage"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        return button
    }()

    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configBackGroundColor()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func addElements(){
        addSubview(self.messageTextField)
        addSubview(self.messageButton)
        addSubview(self.tableView)
    }
    
    public func configTableViewCells(delegate:UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func configBackGroundColor(){
        self.backgroundColor = UIColor(displayP3Red: 0/255, green: 203/255, blue: 214/255, alpha: 1.0)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
           
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.messageTextField.topAnchor, constant: -20),
            
            messageTextField.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            messageTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            messageTextField.heightAnchor.constraint(equalToConstant: 40),
            messageTextField.widthAnchor.constraint(equalToConstant: 300),
            
            messageButton.centerYAnchor.constraint(equalTo: self.messageTextField.centerYAnchor),
            messageButton.leadingAnchor.constraint(equalTo: self.messageTextField.trailingAnchor, constant: 10),
            messageButton.heightAnchor.constraint(equalToConstant: 60),
            messageButton.widthAnchor.constraint(equalToConstant: 60),
  
        ])
    }
}
