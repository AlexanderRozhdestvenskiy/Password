//
//  PasswordStatusView.swift
//  Password
//
//  Created by Alexander Rozhdestvenskiy on 24.03.2022.
//

import UIKit

class PasswordStatusView: UIView {
    
    let stackView = UIStackView()
    
    let lengthCriteriaView = PasswordCriterialView(text: "8-32 characters (no spaces)")
    let uppercaseCriteriaView = PasswordCriterialView(text: "uppercase letter (A-Z)")
    let lowerCaseCriteriaView = PasswordCriterialView(text: "lowercase (a-z)")
    let digitCriteriaView = PasswordCriterialView(text: "digit (0-9)")
    let specialCharacterCriteriaView = PasswordCriterialView(text: "special character (e.g. !@#$%^)")

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemPink
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .systemGreen
        stackView.distribution = .equalCentering
    }
    
    private func layout() {
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(uppercaseCriteriaView)
        stackView.addArrangedSubview(lowerCaseCriteriaView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharacterCriteriaView)
        
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
}
