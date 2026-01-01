//
//  LoginView.swift
//  DemoProj
//
//  Created by Jyoti Naikwadi on 17/06/25.
//

import SwiftUI

struct LoginView: View {

    @Binding var isLoggedIn: Bool
    @Binding var userData: UserDetailsModel
    @StateObject private var loginVM = LoginViewModel()
    @FocusState private var focusedField: Field?
    @State private var previousFocus: Field = .none
    var onLogin: () -> Void
    
    enum Field: Hashable {
        case username
        case password
        case none
    }
    
    var body: some View {

        VStack(alignment: .leading){
            TextField("Username", text: $loginVM.userNameText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($focusedField, equals: .username)

            if loginVM.isUserNameValidated || loginVM.isButtonClicked {
                if !loginVM.validateUserName() {
                    Text("Username must be at least 4 characters")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            
            
            // Password SecureField
            SecureField("Password", text: $loginVM.passwordText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($focusedField, equals: .password)

            if loginVM.isPasswordValidated || loginVM.isButtonClicked {
                if !loginVM.validatePassword() {
                    Text("Password must contain uppercase, lowercase, number, symbol")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            
            
            Button(action: {
                loginVM.login(){ success in
                    switch success {
                        case true:
                        print("Login successful")
                        userData.name = loginVM.userNameText
                        self.isLoggedIn = true
                        onLogin()
                    case false:
                        print("Login failed")
                    }
                }
            }, label: {
                Text("Login")
            })
            .padding(.top)
        }
        .padding()
        .onChange(of: focusedField) { newFocus in
            switch newFocus {
            case .password:
                loginVM.isUserNameValidated = true // Validate username when moving to password
            case .none?:
                if previousFocus == .password {
                    loginVM.isPasswordValidated = true // Validate password when moving away from password (e.g., to button)
                }
            default:
                break
            }

            previousFocus = newFocus ?? .none
        }
  }
}

//#Preview {
//    LoginView( isLoggedIn: .constant(false), userData: .constant(UserDetailsModel(name: "", email: "")))
//}
