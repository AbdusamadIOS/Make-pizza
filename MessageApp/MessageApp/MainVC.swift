//
//  MainVC.swift
//  MessageApp
//
//  Created by Abdusamad Mamasoliyev on 17/03/24.
//

import UIKit

class MainVC: UIViewController {

    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar()
        style()
        layout()
       
    }
    func navBar() {
        navigationItem.title = "Message"
        let edit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButton))
        let pen = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(penButton))
        navigationItem.leftBarButtonItem = edit
        navigationItem.rightBarButtonItem = pen
    }
    
    func style() {
        view.backgroundColor = .brown
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        setupTableView()
    }
    
    func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
    }
    @objc func editButton() {
    }
    @objc func penButton() {
        
    }
}

