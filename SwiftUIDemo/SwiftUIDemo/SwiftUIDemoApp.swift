//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 30/12/24.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView( isLoggedIn: .constant(false), userData: .constant(UserDetailsModel(name: "", email: "")), onLogin: {
                
            })//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
