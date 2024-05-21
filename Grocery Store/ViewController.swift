//
//  ViewController.swift
//  Grocery Store
//
//  Created by Iago de Sousa Campelo Matos on 21/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var topView: UIView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Call the setup function to configure the UI elements
            setupCornerRadius()
            setupShadow()
        }

        private func setupCornerRadius() {
            // Email TextField
            emailTextField.layer.cornerRadius = 16
            emailTextField.layer.masksToBounds = true
            
            // Password TextField
            passwordTextField.layer.cornerRadius = 16
            passwordTextField.layer.masksToBounds = true
            
            // Forgot Password Button
            forgotPasswordButton.layer.cornerRadius = 0 // No corner radius
            
            // Login Button
            loginButton.layer.cornerRadius = 28
            loginButton.layer.masksToBounds = true
            
            // Top View
            topView.layer.cornerRadius = 24
            topView.layer.masksToBounds = true
        }

        private func setupShadow() {
            // Shadow for Email TextField
            emailTextField.layer.shadowColor = UIColor.black.cgColor
            emailTextField.layer.shadowOpacity = 0.1
            emailTextField.layer.shadowOffset = CGSize.zero
            emailTextField.layer.shadowRadius = 20
            emailTextField.layer.masksToBounds = false
            
            // Shadow for Password TextField
            passwordTextField.layer.shadowColor = UIColor.black.cgColor
            passwordTextField.layer.shadowOpacity = 0.1
            passwordTextField.layer.shadowOffset = CGSize.zero
            passwordTextField.layer.shadowRadius = 20
            passwordTextField.layer.masksToBounds = false
        }
    }
