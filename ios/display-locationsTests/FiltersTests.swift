//
//  filtersTests.swift
//  display-locationsTests
//
//  Created by Nathan Perry on 9/29/24.
//

import Testing
@testable import display_locations

struct FiltersTests {
    @Test func testVisibleLocations() async throws {
        let filters = Filters()
        filters.filters = [
            LocationType.restaurant: true
        ]
        filters.locations = [
            Location.init(id: 0, latitude: 0, longitude: 0, name: "i'm a restaurant", type: .restaurant, description: "", estimatedRevenueMillions: 0),
            Location.init(id: 0, latitude: 0, longitude: 0, name: "i'm a bar", type: .bar, description: "", estimatedRevenueMillions: 0)
        ]
        let visibleNames = filters.visibleLocations.map { $0.name }
        #expect(visibleNames.contains("i'm a restaurant"))
        #expect(!visibleNames.contains("i'm a bar"))
    }
}
