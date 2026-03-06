//
//  FocusableFormView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 05/03/26.
//
import SwiftUI

struct FocusableFormView: View {
    
    @State var userName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @FocusState private var focusedField: Field?
    
    enum Field {
        case userName, email, _password
    }
    
    var body: some View {
        Form {
            TextField("User Name", text: $userName)
                .focused($focusedField, equals: .userName)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .email
                }
            
            TextField("Email", text: $email)
                .focused($focusedField, equals: .email)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = ._password
                }
            
            SecureField("Password", text: $password)
                .focused($focusedField, equals: ._password)
                .submitLabel(.done)
                .onSubmit {
                    focusedField = nil
                    submitForm()
                }
            
        }
        
        .onTapGesture {
            hideKeyBoard()
        }
    }
    
    private func submitForm() {
        // Handle Form Submission
        print("Form Submitted")
    }
}


extension View {
    func hideKeyBoard(){
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}


#Preview {
    FocusableFormView()
}
