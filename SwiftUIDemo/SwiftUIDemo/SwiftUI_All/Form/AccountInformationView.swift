//
//  AccountInformationView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 05/03/26.
//
import SwiftUI

struct AccountInformationView: View {
    @State var userName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var phoneNumber: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Account Information")) {
                TextField("User Name", text: $userName)
                    .textInputAutocapitalization(.never)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
            }
            
            Section(header: Text("Personal Information")) {
                TextField("Name", text: .constant("Bhimashankar"))
                TextField("Address", text: .constant("Solapur"))
                Text("PAN : AAAAA1234C")
            }
        }
    }
}



#Preview {
    AccountInformationView()
}
