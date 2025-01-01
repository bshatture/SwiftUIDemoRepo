//
//  RegisterView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 31/12/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter first name", text: $registerViewModel.fName)
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter last name", text: $registerViewModel.lName)
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter email id", text: $registerViewModel.emailId)
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter user name", text: $registerViewModel.userName)
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter Password", text: $registerViewModel.password)
                .textFieldStyle(.roundedBorder)
    
            Button("Register", action: {
                registerViewModel.registerUser()
            })
            .padding()
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(10)
        }
    }
}

#Preview {
    RegisterView()
}
