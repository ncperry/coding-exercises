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
    @MainActor @State private var selectedTypes = [LocationType]()
    @ObservedObject var filters = Filters()

    @MainActor @State private var isOn = true;
    var body: some View {
        VStack {
            Menu("Location Types") {
                ForEach(LocationType.displayedCases(), id: \.self) { locationType in
                    Toggle(isOn: filters.binding(for: locationType)) {
                        Text(locationType.label)
                    }
                }
            }
            .menuActionDismissBehavior(.disabled)
            Map(initialPosition: initialMapRegion) {
                ForEach(filters.visibleLocations) { location in
                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                }
            }
            .mapControlVisibility(.hidden)
            .onAppear {
                Task {
                    let fetcher = LocationFetcher.shared
                    filters.locations = try! await fetcher.fetchLocations()
                }
            }
        }
    }


    init() {
        sanFranciscoCoordinates = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        initialMapRegion = MapCameraPosition.region(
            MKCoordinateRegion(
                center: sanFranciscoCoordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            )
        )
    }
}

#Preview {
    ContentView()
}
