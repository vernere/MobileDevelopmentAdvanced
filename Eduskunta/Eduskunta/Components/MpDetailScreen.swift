//
//  MpDetailScreen.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftData
import SwiftUI

struct MpDetailScreen: View {
    
    let personNumber: Int
    
    @Query private var mps: [Mp]
    
    @State private var viewModel: MpDetailViewModel
    
    init(personNumber: Int, reviewRepository: ReviewRepository) {
        self.personNumber = personNumber
        _viewModel = State(initialValue: MpDetailViewModel(reviewRepository: reviewRepository))
        
        let pn = personNumber
        _mps = Query(filter: #Predicate<Mp> { $0.personNumber == pn})
    }
    
    var body: some View {
        Group {
            if let mp = mps.first {
                content(for: mp)
            } else {
                
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(mps.first.map {"\($0.firstName) \($0.lastName)" } ?? "")
    }
    
    @ViewBuilder
    private func content(for mp: Mp) -> some View {
        let reviews = mp.reviews.sorted { $0.date > $1.date }
        
        List {
            Section {
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
                        Image(systemName: "person.crop.rectangle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.secondary)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 280)
                .frame(maxWidth: .infinity)
                .clipped()
                .listRowInsets(EdgeInsets())
                
                infoBlock(for: mp)
            }
            
            Section {
                AddReviewSectionView { isPositive, text in
                    viewModel.addReview(to: mp, isPositive: isPositive, text: text)
                }
                .listRowInsets(EdgeInsets())
            }
            
            Section {
                if reviews.isEmpty {
                    Text("Ei arvioita vielä")
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .listRowInsets(EdgeInsets())
                } else {
                    ForEach(reviews, id: \.persistentModelID) { review in
                        ReviewCardView(review: review)
                            .listRowInsets(EdgeInsets())
                        
                    }
                }
            } header: {
                Text("Arviot (\(reviews.count))")
                    .font(.subheadline.weight(.semibold))
                    .textCase(nil)
            }
        }
        .listStyle(.plain)
    }
    
    @ViewBuilder
    private func infoBlock(for mp: Mp) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(mp.firstName) \(mp.lastName)")
                .font(.title3.weight(.semibold))
            
            Text("Puolue: \(PartyNames.fullName(for: mp.party))")
            Text("Vaalipiiri: \(mp.constituency)")
            Text("Ikä: \(AgeCalculator.age(bornYear: mp.bornYear)) vuotta")
            
            
            if let twitter = mp.twitter,
               let url = URL(string: twitter) {
                Link(displayHandle(from: twitter), destination: url)
                    .padding(.top, 4)
            }
        }
        .padding(16)
    }
    
    private func displayHandle(from urlString: String) -> String {
        guard let url = URL(string: urlString) else { return urlString }
        let last = url.lastPathComponent
        return last.isEmpty ? urlString : "@\(last)"
    }
}
