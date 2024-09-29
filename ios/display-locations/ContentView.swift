//
//  ContentView.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let initialMapRegion = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )

    var body: some View {
        Map(initialPosition: initialMapRegion) {

        }
        .mapControlVisibility(.hidden)
    }
}

#Preview {
    ContentView()
}
