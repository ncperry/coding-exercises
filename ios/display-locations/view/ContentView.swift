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
    @State private var displayError: Bool = false

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
                    Annotation(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                        location.type.iconName.map { iconName in
                            Image(iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .border(.black, width: 1)
                        }
                    }
                    .tag(location.id)
                }
            }
            .mapControlVisibility(.hidden)
            .onAppear {
                Task {
                    let fetcher = LocationFetcher.shared
                    do {
                        filters.locations = try await fetcher.fetchLocations()
                    } catch {
                        displayError = true
                    }
                }
            }
            .sheet(isPresented: $presentDetail, content: {
                selectedLocation().map { selectedLocation in
                    LocationDetailView(presentedAsModal: self.$presentDetail, location: selectedLocation)
                }
            })
            .onChange(of: selection) {
                presentDetail = selection != nil
            }
            .alert("Failed to load locations. Please contact support.", isPresented: $displayError) {
                Button("Ok", role: .cancel) {
                    displayError = false
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

    private func selectedLocation() -> Location? {
        filters.locations.first(where: { $0.id == selection })
    }
}

#Preview {
    ContentView()
}
