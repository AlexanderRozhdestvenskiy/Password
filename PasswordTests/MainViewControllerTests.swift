//
//  MainViewControllerTests.swift
//  PasswordTests
//
//  Created by Alexander Rozhdestvenskiy on 09.11.2022.
//

import XCTest

@testable import Password

class MainViewControllerTests: XCTestCase {
    
    var vc: MainViewController!
    let validPassword = "12345Aa!"
    let tooShort = "1Aa!"
    
    override func setUp() {
        super.setUp()
        
        vc = MainViewController()
    }
    
    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        vc.resetButtonTap()
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "Enter your password")
    }
    
    func testInvalidPassword() throws {
        vc.newPasswordText = "💻"
        vc.resetButtonTap()
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
    }
    
    func testCriteriaNotMet() throws {
        vc.newPasswordText = tooShort
        vc.resetButtonTap()
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "Your password must meet the requirements below")
    }
    
    func testValidPassword() throws {
        vc.newPasswordText = validPassword
        vc.resetButtonTap()
        
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text!, "")
    }
}

class ConfirmPasswordValidation: XCTestCase {
    
    var vc: MainViewController!
    let validPassword = "12345Aa!"
    let tooShort = "1Aa!"
    
    override func setUp() {
        super.setUp()
        
        vc = MainViewController()
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordText = ""
        vc.resetButtonTap()
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "Enter your password.")
    }
    
    func testPasswordsDoNotMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetButtonTap()
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "Password do not match.")
    }
    
    func testPasswordsMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetButtonTap()
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "")
    }
}
