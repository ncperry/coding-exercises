//
//  location_fetcher.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import Foundation

struct LocationFetcher {
    var session = URLSession.shared
    let url = URL.init(string: "https://raw.githubusercontent.com/ncperry/coding-exercises/refs/heads/master/mobile/map-locations/locations.json")!


    func fetchLocations() async throws -> String? {
        let (data, _) = try await session.data(from: url)
        let json = String(bytes: data, encoding: String.Encoding.utf8)
        return json
    }
}
