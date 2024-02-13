//
//  ViewController.swift
//  StoryBoard para MVVM e VIEWCODE
//
//  Created by Jeferson Dias dos Santos on 19/02/23.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: ViewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")

    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        
        cell?.setupCell(user: self.viewModel.loadCurrentUser(indexPath: indexPath))
        cell?.delegate(delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.viewModel.getName(indexPath: indexPath))
    }
    
    
}

extension ViewController: CustomTableViewCellDelegate{
    
    func tappedHeartButton(_ user: User) {
        self.viewModel.exchangeHeartState(user)
    }
    
    
}
