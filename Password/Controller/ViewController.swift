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
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextField(placeholderText: "Re-enter new password")
    let resetButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
}

extension ViewController {
    private func setup() {
        setupDismissKeyboardGesture()
    }
    
    private func setupDismissKeyboardGesture() {
        let didmissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(didmissKeyboardTap)
    }
    
    @objc private func viewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.delegate = self
        
        statusView.layer.cornerRadius = 8
        statusView.clipsToBounds = true
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.configuration = .filled()
        resetButton.setTitle("Reset password", for: [])
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension ViewController: PasswordTextFieldDelegate {
    func editingChanged(_ sender: PasswordTextField) {
        if sender === newPasswordTextField {
            statusView.updateDisplay(sender.textField.text ?? "")
        }
    }
    
    func editingDidEnd(_ sender: PasswordTextField) {
        print("😀 - \(String(describing: sender.textField.text))")
    }
}
