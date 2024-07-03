//
//  SecondViewController.swift
//  Second
//
//  Created by Тимофей Тарасов on 02.07.2024.
//

import UIKit

class SecondViewController: UIViewController {

    var password: String = "123123"
    
    var userDefaults = UserDefaults.standard
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var infoBackground: UIView!
    
    @IBOutlet weak var extraBackround: UIView!
    
    @IBOutlet weak var nameField: UILabel!
    
    @IBOutlet weak var dateField: UILabel!
    
    @IBOutlet weak var emailField: UILabel!
    
    @IBOutlet weak var jenreOne: UILabel!
    
    @IBOutlet weak var jenreTwo: UILabel!
    @IBOutlet weak var jenreThree: UILabel!
    
    @IBOutlet weak var jenreFour: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = 100
        infoBackground.layer.cornerRadius = 10
        extraBackround.layer.cornerRadius = 10
        if userDefaults.string(forKey: "User") == "admin" {
            nameField.text = "Admin"
            dateField.text = "5 февраля 2003"
            emailField.text = "timofiei.tarasov@gmail.com"
            jenreOne.text = "Фантастика"
            jenreTwo.text = "Детектив"
            jenreThree.text = "Документальные"
            jenreFour.text = "Сказки"
        }
        if userDefaults.string(forKey: "User") == "user" {
            nameField.text = "User"
            dateField.text = "21 февраля 2006"
            emailField.text = "user@email.com"
            jenreOne.text = "История"
            jenreTwo.text = "Обществознание"
            jenreThree.text = "Нонфикшн"
            jenreFour.text = "Игровые"
        }
    }
    
    
    func getValueToUserDefaults() {
        print(userDefaults.string(forKey: "User") ?? "")
    }

    func setValueToUserDefaults(user: String) {
        userDefaults.setValue(user, forKey: "User")
    }
}
