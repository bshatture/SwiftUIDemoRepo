//
//  RouterViewModifier.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 03/03/26.
//

import Foundation
import SwiftUI

struct RouterViewModifier: ViewModifier {

    @State private var router = Router()

    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .environment(router)
                .navigationDestination(for: Route.self) { route in
                    destinationView(for: route)
                        .environment(router)
                }
        }
    }
    
    @ViewBuilder
    private func destinationView(for route: Route) -> some View {
        switch route {
        case .registerView:
            RegisterView()
        case .dashboardView:
            DashboardView()
        
        }
    }
}


extension View{
    public func router() -> some View {
        modifier(RouterViewModifier())
    }
}
