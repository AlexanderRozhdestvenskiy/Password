//
//  PasswordTextField.swift
//  Password
//
//  Created by Alexander Rozhdestvenskiy on 15.03.2022.
//

import UIKit

class PasswordTextField: UIView {
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField = UITextField()
    let placeholderText: String
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorLabel = UILabel()
    
    init(placeholderText: String) {
        self.placeholderText = placeholderText
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
}

extension PasswordTextField {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemOrange
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = false
        textField.placeholder = placeholderText
//        textField.delegate = self
        textField.keyboardType = .asciiCapable
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = .preferredFont(forTextStyle: .footnote)
        errorLabel.text = "Enter your password"
        errorLabel.adjustsFontSizeToFitWidth = true
        errorLabel.minimumScaleFactor = 0.8
        errorLabel.textColor = .systemRed
        errorLabel.textAlignment = .left
        errorLabel.isHidden = false
    }
    
    private func layout() {
        addSubview(lockImageView)
        addSubview(textField)
        addSubview(eyeButton)
        addSubview(dividerView)
        addSubview(errorLabel)
        
        lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
        lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: lockImageView.trailingAnchor, constant: 8).isActive = true
        
        eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
        eyeButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8).isActive = true
        eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        dividerView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8).isActive = true
        dividerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        errorLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        // CHCR
        
        lockImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        eyeButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
    
    @objc private func togglePasswordView() {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}
