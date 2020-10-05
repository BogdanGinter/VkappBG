//
//  ViewController.swift
//  Weather
//
//  Created by Богдан Гинтер on 22.08.2020.
//  Copyright © 2020 Bogdan Ginter. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var processBarView: ProcessBar!

    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        }
        
        @objc
        func keyboardWillShow(notification: Notification) {
            
            guard  let keyboardHeight = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            
            scrollView.contentInset.bottom = keyboardHeight.height
        }
        
        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            if loginTextField.text == "", passwordTextField.text == "" {
                return true
            }
            
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default)
            
            alert.addAction(action)
            
            present(alert, animated: true)
            
            return false
        }
        
    }

    extension LoginViewController: WKNavigationDelegate {
        
        
      
        
    }
