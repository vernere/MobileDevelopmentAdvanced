//
//  ContentView.swift
//  WelcomPage
//
//  Created by Vertti on 23.3.2026.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        #if os(iOS)
        .tabViewStyle(.page)
        #endif
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
