//
//  FriendsViewController.swift
//  MyApp
//
//  Created by Den on 14.08.2023.
//

import UIKit

class FriendsViewController: UITableViewController {
    private var networkService = NetworkService()
    private var models: [Friend] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(tap))
        tableView.register(FriendsViewCell.self, forCellReuseIdentifier: "Friends")

        networkService.getFriends() { [ weak self ] friends in
                   self?.models = friends
                   DispatchQueue.main.async {
                       self?.tableView.reloadData()
                   }
               }
        
    }
    
    @objc private func tap() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .fade
        animation.duration = 0.5
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileViewController(isUserProfile: true), animated: false)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friends", for: indexPath)
        guard let cell = cell as? FriendsViewCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.updateCell(friend: model)
        return cell
    }
    
}

