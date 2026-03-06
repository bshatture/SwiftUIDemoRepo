//
//  BasicForm.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 05/03/26.
//
import SwiftUI

struct BasicFormView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter Your Name", text: $name)
                TextField("Enter Your Email", text: $email)
            }
            .navigationTitle("Basic Form")
        }
    }
}


#Preview {
    BasicFormView()
}
