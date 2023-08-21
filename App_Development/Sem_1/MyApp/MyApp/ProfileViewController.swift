//
//  ProfileViewController.swift
//  MyApp
//
//  Created by Den on 20.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var networkService = NetworkService()
    private var models: Profile?
    
    private lazy var userImage: UIImageView = {
           let imageView = UIImageView()
           imageView.layer.cornerRadius = 10
           imageView.clipsToBounds = true

           return imageView
       }()
    
    private lazy var nameLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.textAlignment = .center

            return label
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My profile"
        view.addSubview(userImage)
        view.addSubview(nameLabel)
        networkService.getProfile()
        setupText(friend: models!)
        
    }
    func setupText(friend: Profile) {
        
        nameLabel.text = friend.firstName! + " " + friend.lastName!
        
    }
}

