//
//  DynamicToggleView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 06/03/26.
//

import SwiftUI

struct DynamicToggleView: View {
    @State private var notificationsEnabled = false
    @State private var allowLocationAccess = false
    @State private var useAdvancedSettings: Bool = false
    @State private var customEndpoint: String = ""
    @State private var refreshInterval: Double = 30.0
    
    var body: some View {
        Form {
            Section(header: Text("Notifications")) {
                Toggle("Enable Push Notifications", isOn: $notificationsEnabled)
                
                if notificationsEnabled {
                    Toggle("Locaiton-based Alerts", isOn: $allowLocationAccess)
                        .transition(.opacity)
                }
            }
            
            Section(header: Text("Advanced Settings")) {
                Toggle("User advanced configuration", isOn: $useAdvancedSettings)
                
                if useAdvancedSettings {
                    TextField("Custom API endpoint", text: $customEndpoint)
                        .textInputAutocapitalization(.never)
                    
                    VStack(alignment: .leading) {
                        Text("Refresh intervals : \(refreshInterval) senconds")
                        Slider(value:$refreshInterval , in:10...300 , step: 10)
                    }
                }
            }
        }
        .animation(.easeInOut, value: notificationsEnabled)
        .animation(.easeInOut, value: useAdvancedSettings)
    }
}


#Preview {
    DynamicToggleView()
}
