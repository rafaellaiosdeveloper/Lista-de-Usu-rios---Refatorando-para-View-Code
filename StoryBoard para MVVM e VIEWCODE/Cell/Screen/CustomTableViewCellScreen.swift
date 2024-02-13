//
//  CustomTableViewCellScreen.swift
//  StoryBoard para MVVM e VIEWCODE
//
//  Created by Rafaella Rodrigues Santos on 13/02/24.
//

import UIKit

class CustomTableViewCellScreen: UIView {
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        return imageView
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var professionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var salaryLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.configConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        self.addSubview(self.userImageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.ageLabel)
        self.addSubview(self.professionLabel)
        self.addSubview(self.salaryLabel)
        self.addSubview(self.heartButton)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.userImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 18),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.userImageView.heightAnchor.constraint(equalToConstant: 128),
            self.userImageView.widthAnchor.constraint(equalToConstant: 128),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.userImageView.topAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 12),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.heartButton.leadingAnchor,constant: -5),
            
            self.ageLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor,constant: 10),
            self.ageLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.ageLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            
            self.professionLabel.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor,constant: 10),
            self.professionLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.professionLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            
            self.salaryLabel.topAnchor.constraint(equalTo: self.professionLabel.bottomAnchor,constant: 10),
            self.salaryLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.salaryLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            
            self.heartButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            self.heartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            self.heartButton.heightAnchor.constraint(equalToConstant: 22),
            self.heartButton.widthAnchor.constraint(equalToConstant: 22),
            
            
        ])
    }
}
