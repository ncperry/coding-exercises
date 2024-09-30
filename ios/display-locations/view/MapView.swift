//
//  MapView.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    let sanFranciscoCoordinates: CLLocationCoordinate2D
    let initialMapRegion: MapCameraPosition

    @ObservedObject var filters = Filters()
    var selection: Binding<Int?>

    var body: some View {
        Map(initialPosition: initialMapRegion, selection: selection) {
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
    }

    init(filters: Filters, selection: Binding<Int?>) {
        self.filters = filters
        self.selection = selection

        sanFranciscoCoordinates = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        initialMapRegion = MapCameraPosition.region(
            MKCoordinateRegion(
                center: sanFranciscoCoordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            )
        )
    }
}
