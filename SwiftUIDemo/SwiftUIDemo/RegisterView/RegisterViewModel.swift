//
//  RegisterViewModel.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 01/01/25.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject{
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var fName: String = ""
    @Published var lName: String = ""
    @Published var emailId: String = ""
    
    
    func registerUser(){
        print("User Details : \n \(userName)")
    }
}
