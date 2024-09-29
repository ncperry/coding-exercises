//
//  map_viewTests.swift
//  display-locationsTests
//
//  Created by Nathan Perry on 9/29/24.
//

import Testing
import MapKit
@testable import display_locations

struct map_viewTests {

    @Test func testInitialLocation() async throws {
        let contentView = await ContentView.init()
        let sanFranciscoCoordinates = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        let latitude = await contentView.initialMapRegion.region!.center.latitude
        let longitude = await contentView.initialMapRegion.region!.center.longitude
        #expect(latitude == sanFranciscoCoordinates.latitude)
        #expect(longitude == sanFranciscoCoordinates.longitude)
    }

}
