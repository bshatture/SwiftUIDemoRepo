//
//  Login.swift
//  DemoProjTests
//
//  Created by Jyoti Naikwadi on 19/06/25.
//

import XCTest

@testable import SwiftUIDemo
final class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
        
    override func setUpWithError() throws {
        super.setUp()
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }

    func testValidUsername() {
        viewModel.userNameText = "John"
        XCTAssertTrue(viewModel.validateUserName())
    }
    
    func testInvalidUsername() {
        viewModel.userNameText = "joh"
        XCTAssertFalse(viewModel.validateUserName())
    }
    
    func testEmptyUsername() {
        viewModel.userNameText = ""
        XCTAssertFalse(viewModel.validateUserName())
    }
    
    func testValidPassword() {
        viewModel.passwordText = "Aa!1"
        XCTAssertTrue(viewModel.validatePassword())
    }
    
    func testPasswordMissingUppercase() {
        viewModel.passwordText = "aa!1"
        XCTAssertFalse(viewModel.validatePassword())
    }
    
    func testPasswordMissingLowercase() {
        viewModel.passwordText = "AA!1"
        XCTAssertFalse(viewModel.validatePassword())
    }
    
    func testPasswordMissingNumber() {
        viewModel.passwordText = "Aa!"
        XCTAssertFalse(viewModel.validatePassword())
    }
    
    func testPasswordMissingSpecialCharacter() {
        viewModel.passwordText = "Aa1"
        XCTAssertFalse(viewModel.validatePassword())
    }
    
    func testPasswordTooShort() {
        viewModel.passwordText = "Aa"
        XCTAssertFalse(viewModel.validatePassword())
    }
    
    func testPasswordEmpty() {
        viewModel.passwordText = ""
        XCTAssertFalse(viewModel.validatePassword())
    }
    
    func testLoginSuccess() {
        viewModel.userNameText = "ValidUser"
        viewModel.passwordText = "Pass@123"

        let expectation = self.expectation(description: "Login completes")
        viewModel.login { success in
            XCTAssertTrue(success)
            XCTAssertTrue(self.viewModel.isUserNameValidated)
            XCTAssertTrue(self.viewModel.isPasswordValidated)
            XCTAssertTrue(self.viewModel.isButtonClicked)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
    
    func testLoginFailure_InvalidUsername() {
        viewModel.userNameText = "abc"
        viewModel.passwordText = "Pass@123"

        let expectation = self.expectation(description: "Login completes")
        viewModel.login { success in
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
    
    func testLoginFailure_InvalidPassword() {
        viewModel.userNameText = "ValidUser"
        viewModel.passwordText = "password"

        let expectation = self.expectation(description: "Login completes")
        viewModel.login { success in
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
