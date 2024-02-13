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

    @IBOutlet weak var imageUserImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var viewModel: CustomCellViewModel?
    
    private weak var delegate: CustomTableViewCellDelegate?
    
    public func delegate(delegate: CustomTableViewCellDelegate?){
        self.delegate = delegate
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageUserImageView.clipsToBounds = true
        imageUserImageView.layer.cornerRadius = imageUserImageView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(user: User) {
        self.viewModel = CustomCellViewModel(data: user)
        self.imageUserImageView.image = self.viewModel?.getUserImage
        self.nameLabel.text = self.viewModel?.getName
        self.professionLabel.text = self.viewModel?.getProfession
        self.salaryLabel.text = self.viewModel?.getSalary
        self.idadeLabel.text = self.viewModel?.getAge
        
        
        if self.viewModel?.getIsEnableHeart ?? false {
            self.heartButton.tintColor = .red
        } else {
            self.heartButton.tintColor = .blue
        }
    }
    @IBAction func tappedHeartButton(_ sender: UIButton) {
        
        guard let _viewModel = viewModel else {return}
        
        if _viewModel.getIsEnableHeart{
            self.heartButton.tintColor = .blue
            self.viewModel?.exchangeHearState(false)
        } else {
            self.heartButton.tintColor = .red
            self.viewModel?.exchangeHearState(true)
        }
        self.delegate?.tappedHeartButton(_viewModel.getUser)
    }
}
