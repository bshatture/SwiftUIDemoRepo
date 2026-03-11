//
//  AnyTransition+Extension.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 11/03/26.
//

import SwiftUI

extension AnyTransition {
    static var slideInFromRight: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing).combined(with: .scale(scale: 0.8).combined(with: .opacity)),
            removal: .move(edge: .leading).combined(with: .scale(scale: 1.2).combined(with: .opacity))
        )
    }
    
    static var slideInFromLeft: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .leading).combined(with: .scale(scale: 0.8).combined(with: .opacity)),
            removal: .move(edge: .trailing).combined(with: .scale(scale: 1.2).combined(with: .opacity))
        )
    }
}
