//
//  ViewController.swift
//  Password
//
//  Created by Alexander Rozhdestvenskiy on 14.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    
    let newPasswordTextField = PasswordTextField(placeholderText: "New Password")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension ViewController {
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = true
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(newPasswordTextField)
        
        newPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        newPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        newPasswordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

