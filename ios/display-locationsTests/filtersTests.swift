//
//  filtersTests.swift
//  display-locationsTests
//
//  Created by Nathan Perry on 9/29/24.
//

import Testing
@testable import display_locations

struct filtersTests {
    @Test func testVisibleLocations() async throws {
        let filters = Filters()
        filters.filters = [
            LocationType.restaurant: true
        ]
        filters.locations = [
            Location.init(id: 0, latitude: 0, longitude: 0, attributes: [
                .init(type: "name", value: .string("i'm a restaurant")),
                .init(type: "location_type", value: .string("restaurant"))
            ]),
            Location.init(id: 0, latitude: 0, longitude: 0, attributes: [
                .init(type: "name", value: .string("i'm a bar")),
                .init(type: "location_type", value: .string("bar"))
            ])
        ]
        let visibleNames = filters.visibleLocations.map { $0.name }
        #expect(visibleNames.contains("i'm a restaurant"))
        #expect(!visibleNames.contains("i'm a bar"))
    }
}
