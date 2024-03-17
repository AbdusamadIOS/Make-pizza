//
//  MainVC+TableView.swift
//  MessageApp
//
//  Created by Abdusamad Mamasoliyev on 17/03/24.
//

import Foundation
import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainVCCell.self, forCellReuseIdentifier: MainVCCell.identifeir)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainVCCell.identifeir, for: indexPath) as? MainVCCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
