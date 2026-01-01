//
//  LoginViewModel.swift
//  DemoProj
//
//  Created by Jyoti Naikwadi on 18/06/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var userNameText: String = ""
    @Published var passwordText: String = ""
    
    @Published var isButtonClicked: Bool = false
    @Published var isUserNameValidated: Bool = false
    @Published var isPasswordValidated: Bool = false
    
    // MARK: - Username Validation
    func validateUserName() -> Bool {
        // Username must be at least 4 characters
        return !userNameText.isEmpty && userNameText.count >= 4
    }
    
    // MARK: - Password Validation
    func validatePassword() -> Bool {
        // Password must include: 1 lowercase, 1 uppercase, 1 digit, 1 special char, min length 4
        return !passwordText.isEmpty && isValidPassword(passwordText)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // Regex explanation:
        // (?=.*[a-z])        → at least one lowercase letter
        // (?=.*[A-Z])        → at least one uppercase letter
        // (?=.*\\d)          → at least one digit
        // (?=.*[!@#$%^&*()_+=\\-\\[\\]{};':\"\\\\|,.<>\\/?]) → at least one special character
        // .{4,}              → at least 4 characters total (you can adjust this)

        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+=\\-\\[\\]{};':\"\\\\|,.<>\\/?]).{4,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }
    
    func login(onCompletion: @escaping (Bool) -> Void) {
        isButtonClicked = true
        isUserNameValidated = true
        isPasswordValidated = true

        let sucess = validateUserName() && validatePassword()
        onCompletion(sucess)
    }
}
