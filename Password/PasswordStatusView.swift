//
//  PasswordStatusView.swift
//  Password
//
//  Created by Alexander Rozhdestvenskiy on 24.03.2022.
//

import UIKit

class PasswordStatusView: UIView {

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
    }
    
    private func layout() {
        
    }
    
}
