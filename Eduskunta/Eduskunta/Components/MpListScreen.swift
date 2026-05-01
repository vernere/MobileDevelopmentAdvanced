//
//  MpListScreen.swift
//  Eduskunta
//
//  Created by Vertti on 1.5.2026. 2400345
//

import Foundation
import SwiftData
import SwiftUI

struct MpListScreen: View {
    
    @Query(sort: \Mp.lastName) private var mps: [Mp]
    
    @State private var viewModel: MpListViewModel
    
    init(repository: MpRepository) {
        _viewModel = State(initialValue: MpListViewModel(repository: repository))
    }
    
    var body: some View {
        let groups = viewModel.grouped(mps)
        
        List {
            ForEach(groups, id: \.key) { group in
                Section {
                    ForEach(group.value, id: \.personNumber) { mp in
                        NavigationLink(value: Route.mpDetail(personNumber: mp.personNumber)) {
                            MpRowView(mp: mp)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                } header: {
                    GroupHeaderView(
                        title: viewModel.groupBy == .party
                        ? PartyNames.fullName(for: group.key)
                        : group.key
                    )
                    .listRowInsets(EdgeInsets())
                    .textCase(nil)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Kansanedustajat")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(viewModel.groupBy == .party ? "Vaalipiiri" : "Puolue") {
                    viewModel.toggleGrouping()
                }
            }
        }
        .task {
            await viewModel.loadIfNeeded()
        }
    }
}
