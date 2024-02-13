//
//  HomeScreenView.swift
//  StoryBoard para MVVM e VIEWCODE
//
//  Created by Rafaella Rodrigues Santos on 13/02/24.
//

import UIKit

class HomeScreenView: UIView {
    
    lazy var tableView: UITableView = {
    let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupTableVierProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
        
    }
   
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            
        ])
    }
   
}
