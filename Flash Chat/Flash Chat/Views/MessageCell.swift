//
//  MessageCell.swift
//  Flash Chat
//
//  Created by COSME D ALVES SILVA on 13/7/2022.
//

import UIKit

class MessageCell: UITableViewCell {
    
    static let identifier:String = "MessageCell"
    
    lazy var UserImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.contentView.addSubview(self.UserImageView)
        self.contentView.addSubview(self.nameLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            self.UserImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.UserImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.UserImageView.heightAnchor.constraint(equalToConstant: 80),
            self.UserImageView.widthAnchor.constraint(equalToConstant: 80),
            
            self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.UserImageView.trailingAnchor, constant: 20),
        ])
    }

}
