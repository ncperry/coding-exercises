//
//  LocationDetailView.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import SwiftUI

struct LocationDetailView: View {
    @Binding var presentedAsModal: Bool
    var location: Location

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.largeTitle)
            }
            .toolbar {
                Button("Dismiss") {
                    self.presentedAsModal = false
                }
            }
        }
    }
}
