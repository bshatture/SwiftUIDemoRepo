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
            RegisterView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
