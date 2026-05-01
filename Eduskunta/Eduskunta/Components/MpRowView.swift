//
//  MpRowView.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftData
import SwiftUI

struct MpRowView: View {
    let mp: Mp
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(
                url: MpImageUrl.url(
                    firstName: mp.firstName,
                    lastName: mp.lastName,
                    personNumber: mp.personNumber
                )
            ) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill()
                case .empty:
                    ProgressView()
                case .failure:
                    placeholder
                @unknown default:
                    placeholder
                }
            }
            .frame(width: 56, height: 56)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(mp.firstName) \(mp.lastName)")
                    .font(.body)
                Text(mp.constituency)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
    
    private var placeholder: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.secondary)
    }
}

#Preview {

    let container = try! ModelContainer(
        for: Mp.self, Review.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    let sample = Mp(
        personNumber: 1137,
        firstName: "Pauli",
        lastName: "Kiuru",
        party: "kok",
        constituency: "Pirkanmaa",
        twitter: nil,
        bornYear: 1962,
        seatNumber: 85,
        picture: ""
    )
    return MpRowView(mp: sample)
        .modelContainer(container)
}
