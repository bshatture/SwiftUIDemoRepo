//
//  SettingsView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 18/03/26.
//

import SwiftUI

@Observable
class UserPreferences {
    var fontSize: CGFloat = 14.0
    var accentColor: Color = .blue
    var enableNotifications: Bool = true
}

struct SettingsView: View {
    @Environment(UserPreferences.self) private var preferences
    
    var body: some View {
        @Bindable var bindableSettings = preferences
        
        Form {
            Slider(value: $bindableSettings.fontSize, in: 12...24)
        }
        
        ColorPicker("Accent Color", selection: $bindableSettings.accentColor)
        
        Toggle("Notifications", isOn: $bindableSettings.enableNotifications)
    }
}


#Preview {
    SettingsView()
}
