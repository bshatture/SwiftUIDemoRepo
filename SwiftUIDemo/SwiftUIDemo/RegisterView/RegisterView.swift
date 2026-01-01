//
//  RegisterView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 31/12/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewModel()
    @State var isNavigated: Bool = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                TextField("Enter first name", text: $registerViewModel.fName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                
                TextField("Enter last name", text: $registerViewModel.lName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                
                TextField("Enter email id", text: $registerViewModel.emailId)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                
                TextField("Enter user name", text: $registerViewModel.userName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                
                TextField("Enter Password", text: $registerViewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)

                NavigationLink(destination: DashboardView(), isActive: $isNavigated){
                    Button("Register"){
                        //                registerViewModel.registerUser()
                        self.isNavigated = true
                    }
                    
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
                }
//                .navigationTitle("Register")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        Text("Register")
                            .font(.system(size: 40, weight: .bold))
                    }
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
