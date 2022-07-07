//
//  ChatScreen.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 4/7/2022.
//

import UIKit

class ChatScreen: UIView {

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
        addSubview(self.tableView)
    }
    
    public func configTableViewCells(delegate:UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func configBackGroundColor(){
        self.backgroundColor = UIColor(displayP3Red: 0/255, green: 203/255, blue: 214/255, alpha: 1.0)
    }
    
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}
