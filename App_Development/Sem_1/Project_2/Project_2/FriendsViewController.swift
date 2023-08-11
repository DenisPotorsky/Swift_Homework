//
//  FriendsViewController.swift
//  Project_2
//
//  Created by Den on 10.08.2023.
//

import UIKit

class FriendsViewController: UITableViewController {
    private let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        networkService.getFriends()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CustomTableViewCell()
    }
}
