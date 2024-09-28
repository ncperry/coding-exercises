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

    @Test mutating func testDecodeLocation() async throws {
        let location = try JSONDecoder().decode(Location.self, from: self.encodedString)
        #expect(location.id == 1)
    }
}
