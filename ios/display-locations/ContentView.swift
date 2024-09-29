//
//  ContentView.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let sanFranciscoCoordinates: CLLocationCoordinate2D
    let initialMapRegion: MapCameraPosition
    var body: some View {
        Map(initialPosition: initialMapRegion) {

        }
        .mapControlVisibility(.hidden)
    }

    init() {
        sanFranciscoCoordinates = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        initialMapRegion = MapCameraPosition.region(
            MKCoordinateRegion(
                center: sanFranciscoCoordinates,
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
    }
}

#Preview {
    ContentView()
}
