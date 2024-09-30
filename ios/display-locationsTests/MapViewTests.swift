//
//  map_viewTests.swift
//  display-locationsTests
//
//  Created by Nathan Perry on 9/29/24.
//

import Testing
import MapKit
import SwiftUI
@testable import display_locations

struct map_viewTests {
    @State private var selection: Int?
    @State private var presentDetail: Bool = false

    @Test func testInitialLocation() async throws {
        let mapView = await MapView.init(filters: Filters(), selection: $selection, presentDetail: $presentDetail)
        let sanFranciscoCoordinates = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        let latitude = await mapView.initialMapRegion.region!.center.latitude
        let longitude = await mapView.initialMapRegion.region!.center.longitude
        #expect(latitude == sanFranciscoCoordinates.latitude)
        #expect(longitude == sanFranciscoCoordinates.longitude)
    }
}
