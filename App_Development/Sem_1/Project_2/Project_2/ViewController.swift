//
//  ViewController.swift
//  Project_2
//
//  Created by Den on 04.08.2023.
//

//
//  ViewController.swift
//  Project_2
//
//  Created by Den on 04.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.backgroundColor = .cyan
        label.textAlignment = .center
        return label
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    let loginTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Логин"
            textField.textAlignment = .center
            textField.borderStyle = .roundedRect
            textField.backgroundColor = .gray
            return textField
        }()
    
    let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Пароль"
            textField.textAlignment = .center
            textField.borderStyle = .roundedRect
            textField.backgroundColor = .gray
            return textField
        }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "face.smiling"))
        imageView.backgroundColor = .gray
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        setupViews()
            }
 
    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(button)
        self.view = view
        setupConstraints()
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                    label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    label.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
                    label.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
                    
                    imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
                    imageView.heightAnchor.constraint(equalToConstant: view.frame.size.width/2),

                    loginTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                    loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    loginTextField.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
                    loginTextField.heightAnchor.constraint(equalToConstant: view.frame.size.width/6),
                    
                    passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
                    passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
                    passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.size.width/6),
                    
                    button.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
                    button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
                ])
        }

   
}

private extension ViewController {
    @objc func tap() {
        let friendsTabController = UINavigationController(rootViewController: FriendsViewController())
        let photosTabController = UINavigationController(rootViewController: CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        let groupsTabController = UINavigationController(rootViewController: GroupsViewController())
        friendsTabController.tabBarItem.title = "Friends"
        groupsTabController.tabBarItem.title = "Groups"
        photosTabController.tabBarItem.title = "Photos"
        let controllers = [friendsTabController, groupsTabController, photosTabController]
        let newTabController = UITabBarController()
        newTabController.viewControllers = controllers
        self.navigationController?.pushViewController(newTabController, animated: true)
        //present(newTabController, animated: true)
    }
}
