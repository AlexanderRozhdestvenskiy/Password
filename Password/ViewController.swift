//
//  ViewController.swift
//  Password
//
//  Created by Alexander Rozhdestvenskiy on 14.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let newPasswordTextField = PasswordTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension ViewController {
    private func style() {
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(newPasswordTextField)
        
        newPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newPasswordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

