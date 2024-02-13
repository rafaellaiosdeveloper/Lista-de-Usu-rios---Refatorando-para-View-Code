//
//  CustomTableViewCell.swift
//  StoryBoard para MVVM e VIEWCODE
//
//  Created by Jeferson Dias dos Santos on 19/02/23.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject{
    func tappedHeartButton(_ user: User)
}

class CustomTableViewCell: UITableViewCell {
    
    var viewModel: CustomCellViewModel?
    
    var screen: CustomTableViewCellScreen = CustomTableViewCellScreen()
    
    private weak var delegate: CustomTableViewCellDelegate?
    
    public func delegate(delegate: CustomTableViewCellDelegate?){
        self.delegate = delegate
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.screen.heartButton.addTarget(self, action: #selector(self.tappedHeartButton), for: .touchUpInside)
        self.contentView.addSubview(self.screen)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedHeartButton(){
        guard let _viewModel = viewModel else {return}
        
        if _viewModel.getIsEnableHeart{
            self.screen.heartButton.tintColor = .blue
            self.viewModel?.exchangeHearState(false)
        } else {
            self.screen.heartButton.tintColor = .red
            self.viewModel?.exchangeHearState(true)
        }
        self.delegate?.tappedHeartButton(_viewModel.getUser)
    }
    
    //Essa config é o mesmo que igualar os 4 lados do elemento igual a 0 em storyboard
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(user: User) {
        self.viewModel = CustomCellViewModel(data: user)
        
        self.screen.userImageView.image = self.viewModel?.getUserImage
        self.screen.nameLabel.text = self.viewModel?.getName
        self.screen.professionLabel.text = self.viewModel?.getProfession
        self.screen.salaryLabel.text = self.viewModel?.getSalary
        self.screen.ageLabel.text = self.viewModel?.getAge
        
        
        if self.viewModel?.getIsEnableHeart ?? false {
            self.screen.heartButton.tintColor = .red
        } else {
            self.screen.heartButton.tintColor = .blue
        }
    }
}
