//
//  ContentView.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Map {

        }
        .mapControlVisibility(.hidden)
    }
}

#Preview {
    ContentView()
}
