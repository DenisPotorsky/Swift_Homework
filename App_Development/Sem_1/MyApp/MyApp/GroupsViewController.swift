//
//  GroupsViewController.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import UIKit

class GroupsViewController: UITableViewController {
    let networkService = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        networkService.getGroups()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CustomTableViewCell2()
    }
}
