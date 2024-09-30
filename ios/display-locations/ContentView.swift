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
    @ObservedObject var filters = Filters()
    @State private var selection: Int?
    @State private var presentDetail: Bool = false

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
            Map(initialPosition: initialMapRegion, selection: $selection) {
                ForEach(filters.visibleLocations) { location in
                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                        .tag(location.id)
                }
            }
            .mapControlVisibility(.hidden)
            .onAppear {
                Task {
                    let fetcher = LocationFetcher.shared
                    filters.locations = try! await fetcher.fetchLocations()
                }
            }
            .sheet(isPresented: $presentDetail, content: { LocationDetailView(presentedAsModal: self.$presentDetail) })
            .onChange(of: selection) {
                presentDetail = selection != nil
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
