//
//  SwiftUIAllConceptView.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 04/03/26.
//

import SwiftUI

struct SwiftUIAllConceptView: View {
    var body: some View {
        Text("Custom Font")
            .font(Font.custom("AutumnRegular", size: 20, relativeTo: .headline))

    }
}

#Preview {
    SwiftUIAllConceptView()
}
