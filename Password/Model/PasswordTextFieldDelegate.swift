//
//  PasswordTextFieldDelegate.swift
//  Password
//
//  Created by Alexander Rozhdestvenskiy on 01.04.2022.
//

import Foundation

protocol PasswordTextFieldDelegate: AnyObject {
    func editingChanged(_ sender: PasswordTextField)
    func editingDidEnd(_ sender: PasswordTextField)
}
