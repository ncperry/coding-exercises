//
//  locationTests.swift
//  display-locationsTests
//
//  Created by Nathan Perry on 9/28/24.
//

import Testing
import Foundation
@testable import display_locations

struct locationTests {

    let jsonString = """
        {
            "id": 1,
            "latitude": 37.7750,
            "longitude": -122.4195,
            "attributes": [
                {
                    "type": "location_type",
                    "value": "restaurant"
                },
                {
                    "type": "name",
                    "value": "Golden Gate Grill"
                },
                {
                    "type": "description",
                    "value": "A popular eatery with views of the bay."
                },
                {
                    "type": "estimated_revenue_millions",
                    "value": 10.5
                }
            ]
        }
    """
    lazy var encodedString: Data = {
        jsonString.data(using: .utf8)!
    }()
    lazy var location: Location = {
        try! JSONDecoder().decode(Location.self, from: self.encodedString)
    }()

    @Test mutating func testDecodeLocation() {
        #expect(location.id == 1)
        #expect(location.latitude == 37.7750)
        #expect(location.longitude == -122.4195)
        #expect(location.type == .restaurant)
        #expect(location.name == "Golden Gate Grill")
        #expect(location.description == "A popular eatery with views of the bay.")
        #expect(location.estimatedRevenueMillions == 10.5)
    }

    @Test mutating func testDecodeAttributes() {
        #expect(location.attributes.count == 4)
        #expect(location.attributes[0].type == "location_type")
        #expect(location.attributes[0].value == .string("restaurant"))
        #expect(location.attributes[3].type == "estimated_revenue_millions")
        #expect(location.attributes[3].value == .double(10.5))
    }
}
