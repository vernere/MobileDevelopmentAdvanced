//
//  ContentView.swift
//  test
//
//  Created by Verner Etola on 16.3.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Knock, knock!")
                .padding(10)
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
            Text("Who's there?")
                .padding(10)
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
