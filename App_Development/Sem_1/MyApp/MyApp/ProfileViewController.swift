//
//  ProfileViewController.swift
//  MyApp
//
//  Created by Den on 20.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var networkService = NetworkService()
    private var isUserProfile: Bool
    
    init(isUserProfile: Bool, photo: UIImage? = nil, name: String? = nil) {
        self.isUserProfile = isUserProfile
        super.init(nibName: nil, bundle: nil)
        nameLabel.text = name
        userImage.image = photo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var userImage: UIImageView = {
           let imageView = UIImageView()
           imageView.layer.cornerRadius = 10
           imageView.clipsToBounds = true

           return imageView
       }()
    
    private var nameLabel: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My profile"
        view.addSubview(userImage)
        view.addSubview(nameLabel)
        setupConstraints()
        networkService.getProfile() { [weak self] profile in
                self?.updateData(model: profile)
            }
        }

        
    func updateData (model: Profile?) {
        guard let model else {
            return
        }
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try?
                Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.userImage.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.main.async {
            self.nameLabel.text = model.firstName! + " " + model.lastName!
        }
    }
    
    private func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            userImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30)
        ])
    }
}

