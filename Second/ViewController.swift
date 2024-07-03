//
//  SViewController.swift
//  Second
//
//  Created by Тимофей Тарасов on 01.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let LOGIN_ADMIN = "admin"
    let PASS_ADMIN = "admin"
    
    let LOGIN_USER = "user"
    let PASS_USER = "user"
    
    var userDefaults = UserDefaults.standard
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginField.textColor = .black
        passField.textColor = .black
        
        loginButton.tintColor = .colorLoginButton
        loginButton.backgroundColor = .colorLoginButton
        passField.isSecureTextEntry = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "123" {
            // получаем наш экран который мы хотим отобразить для передачи данных.
            if let desctViewController = segue.destination as? SecondViewController {
                desctViewController.password = "123123"
            }
        }
    }
        
    @IBAction func authTapped(_ sender: Any) {
        if loginField.text == LOGIN_ADMIN && passField.text == PASS_ADMIN {
            setUserProfile(user: LOGIN_ADMIN)
            
        }  else if loginField.text == LOGIN_USER && passField.text == PASS_USER {
            setUserProfile(user: LOGIN_USER)
        } else {
            errorMessageLabel.text = "Указанный логин/пароль не найдены"
            errorMessageLabel.textColor = .red
        }
    }
    
    func setUserProfile(user: String) {
        performSegue(withIdentifier: "123", sender: self)
        setValueToUserDefaults(user: user)
        getValueToUserDefaults()
        errorMessageLabel.text = ""
    }
    
    func getValueToUserDefaults() {
        print(userDefaults.string(forKey: "User") ?? "")
    }

    func setValueToUserDefaults(user: String) {
        userDefaults.setValue(user, forKey: "User")
    }
}
