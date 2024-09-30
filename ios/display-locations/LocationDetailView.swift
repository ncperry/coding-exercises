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
        Text(location.name)
        Button("dismiss") { self.presentedAsModal = false }
    }
}
