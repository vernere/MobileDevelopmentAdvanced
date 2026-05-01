//
//  GroupHeaderView.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftUI

struct GroupHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color .accentColor)
    }
}

#Preview {
    GroupHeaderView(title: "Kokoomus")
}
