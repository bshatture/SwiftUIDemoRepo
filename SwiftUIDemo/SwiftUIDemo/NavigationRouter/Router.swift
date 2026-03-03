//
//  Router.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 03/03/26.
//

import Foundation
import SwiftUI
import Observation

@MainActor
@Observable
class Router {

    var path = NavigationPath()
    var routes: [Route] = []

    // MARK: - Push
    func push(_ route: Route) {
        path.append(route)
        routes.append(route)
    }

    // MARK: - Pop
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
        routes.removeLast()
    }

    // MARK: - Pop to specific view
    func popTo(_ route: Route) {
        while !routes.isEmpty, routes.last != route {
            path.removeLast()
            routes.removeLast()
        }
    }

    // MARK: - Pop to root
    func popToRoot() {
        path.removeLast(path.count)
        routes.removeLast(path.count)
    }
}

enum Route: Hashable{
    case registerView
    case dashboardView
}
