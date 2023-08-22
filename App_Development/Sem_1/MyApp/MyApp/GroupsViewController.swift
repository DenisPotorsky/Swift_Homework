//
//  GroupsViewController.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    private var networkService = NetworkService()
    private var models: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        tableView.register(GroupsViewCell.self, forCellReuseIdentifier: "GroupsViewCell")
        
        networkService.getGroups() { [ weak self ] groups in
            self?.models = groups
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsViewCell", for: indexPath)
                let model = models[indexPath.row]
                guard let cell = cell as? GroupsViewCell else {
                    return UITableViewCell()
                }
                
                cell.updateCell(group: model)
                return cell
            }
            
        }
