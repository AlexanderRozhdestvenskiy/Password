//
//  PasswordStatusView.swift
//  Password
//
//  Created by Alexander Rozhdestvenskiy on 24.03.2022.
//

import UIKit

class PasswordStatusView: UIView {
    
    let stackView = UIStackView()
    
    let criterialLabel = UILabel()
    
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
        backgroundColor = .tertiarySystemFill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        criterialLabel.translatesAutoresizingMaskIntoConstraints = false
        criterialLabel.numberOfLines = 0
        criterialLabel.lineBreakMode = .byWordWrapping
        criterialLabel.attributedText = makeCriterialView()
    }
    
    private func layout() {
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(criterialLabel)
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
    
    private func makeCriterialView() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        plainTextAttributes[.foregroundColor] = UIColor.secondaryLabel
        
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        boldTextAttributes[.foregroundColor] = UIColor.label
        
        let attrText = NSMutableAttributedString(string: "Use at least ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "3 of these 4 ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "criteria when setting your password:", attributes: plainTextAttributes))
        
        return attrText
    }
}
