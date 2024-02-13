//
//  ViewController.swift
//  StoryBoard para MVVM e VIEWCODE
//
//  Created by Jeferson Dias dos Santos on 19/02/23.
//

import UIKit

class ViewController: UIViewController{
    
    let viewModel: ViewModel = ViewModel()
    
    var screen: HomeScreenView?
    
    override func loadView() {
        self.screen = HomeScreenView()
        self.screen?.setupTableVierProtocols(delegate: self, dataSource: self)
        self.view = screen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
