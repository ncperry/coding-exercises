//
//  location_fetcherTests.swift
//  display-locationsTests
//
//  Created by Nathan Perry on 9/28/24.
//

import Testing
@testable import display_locations

struct location_fetcherTests {
    @Test func testForceUnwrapURL() {
        let fetcher = LocationFetcher.init()
        #expect(fetcher.url != nil)
    }

    @Test func testFetchLocations() async throws {
        let fetcher = LocationFetcher.init()
        let locations = try await fetcher.fetchLocations()
        #expect(locations[0].id == 1)
    }
}
