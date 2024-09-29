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
    @MainActor @State private var locations = [Location]()
    var body: some View {
        Map(initialPosition: initialMapRegion) {
            ForEach(locations) { location in
                Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            }
        }
        .mapControlVisibility(.hidden)
        .onAppear {
            Task {
                let fetcher = LocationFetcher.shared
                locations = try! await fetcher.fetchLocations()
            }
        }
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
