//
//  ValidatedFormView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 06/03/26.
//
import SwiftUI

struct ValidatedFormView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showValidation = false
    @State private var showAlert: Bool = false
    @State private var errorMessage: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Account Setup")) {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .overlay(alignment: .trailing) {
                        if showValidation && !email.isEmpty {
                            Image(systemName: isEmailValid ? "checkmar.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(isEmailValid ? .green : .red)
                        }
                    }
                
                if showValidation && !isEmailValid && !email.isEmpty {
                    Text("Please enter a valid email")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                SecureField("Password", text: $password)
                    .overlay(alignment: .trailing) {
                        if showValidation && !password.isEmpty {
                            Image(systemName: isPasswordValid ? "checkmark.circle.fill" :  "xmark.circle.fill")
                                .foregroundColor(isPasswordValid ? .green : .red)
                        }
                    }
                
                if showValidation && !isPasswordValid && !password.isEmpty {
                    Text("Password must be atleast 8 characters")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .overlay(alignment: .trailing) {
                        if showValidation && !confirmPassword.isEmpty {
                            Image(systemName: passwordsMatch ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(passwordsMatch ? .green : .red)
                        }
                    }
                
                if showValidation && !passwordsMatch && !confirmPassword.isEmpty {
                    Text("Password does not match")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            
            Section {
                Button("Create Account") {
                    submitForm()
                }
            }
        }
        
        .onAppear(){
            showValidation = false
        }
        .alert("Account Created", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    
    
    // Validation Computed property
    private var isEmailValid: Bool {
        email.contains("@") && email.contains(".")
    }
    
    private var isPasswordValid: Bool {
        password.count >= 8
    }
    
    private var passwordsMatch: Bool {
        password == confirmPassword && !confirmPassword.isEmpty
    }
    
    private var formIsValid: Bool {
        isEmailValid && isPasswordValid && passwordsMatch
    }
    
    private func submitForm() {
        showValidation = true
        
        if formIsValid{
            alertMessage = "Welcome! You have signed up successfully."
            showAlert = true
            // Reset Form
            email = ""
            password = ""
            confirmPassword = ""
            showValidation = false
        }
    }
}


#Preview {
    ValidatedFormView()
}
