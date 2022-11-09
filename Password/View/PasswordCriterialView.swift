//
//  PasswordCriterialView.swift
//  Password
//
//  Created by Alexander Rozhdestvenskiy on 21.03.2022.
//

import UIKit

final class PasswordCriterialView: UIView {
    
    private let stackView = UIStackView()
    
    private let imageView = UIImageView()
    private let labelView = UILabel()
    
    private let checkmarkImage = UIImage(systemName: "checkmark.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    private let xmarkImage = UIImage(systemName: "xmark.circle")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    private let circleImage = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
    
    var isCriteriaMet = false {
        didSet {
            if isCriteriaMet {
                imageView.image = checkmarkImage
            } else {
                imageView.image = xmarkImage
            }
        }
    }
    
    init(text: String) {
        super.init(frame: .zero)
        
        labelView.text = text
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 40)
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = .preferredFont(forTextStyle: .subheadline)
        labelView.textColor = .secondaryLabel
    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(labelView)
        
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        imageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        labelView.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
    }
    
    // MARK: Action
    
    func reset() {
        isCriteriaMet = false
        imageView.image = circleImage
    }
}

// MARK: Tests
extension PasswordCriterialView {
    var isCheckMarkImage: Bool {
        imageView.image == checkmarkImage
    }
    
    var isXmarkImage: Bool {
        imageView.image == xmarkImage
    }
    
    var isResetImage: Bool {
        imageView.image == circleImage
    }
}
