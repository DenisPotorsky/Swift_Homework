//
//  ViewController.swift
//  Project_2
//
//  Created by Den on 04.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var autorization: UIButton!
    
    @IBOutlet weak var login: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка цветов
                view.backgroundColor = UIColor.white // Фоновый цвет экрана
                login.backgroundColor = UIColor.lightGray // Фоновый цвет поля "Логин"
                password.backgroundColor = UIColor.lightGray // Фоновый цвет поля "Пароль"
                enterButton.backgroundColor = UIColor.blue // Цвет кнопки "Войти"
                
                // Настройка текста и отступов в полях ввода
                login.placeholder = "Логин"
                password.placeholder = "Пароль"
                login.textAlignment = .center
                password.textAlignment = .center
                login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
                login.leftViewMode = .always
                password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
                password.leftViewMode = .always
                
                // Настройка кнопки "Войти"
                enterButton.setTitle("Войти", for: .normal)
                enterButton.setTitleColor(UIColor.white, for: .normal)
                enterButton.layer.cornerRadius = 10
                enterButton.clipsToBounds = true
            }
    }




