//
//  location_fetcher.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import Foundation

class LocationFetcher {
    var session = URLSession.shared
    let url = URL.init(string: "https://raw.githubusercontent.com/ncperry/coding-exercises/refs/heads/master/mobile/map-locations/locations.json")!
    private var data: Data? = nil

    static let shared = LocationFetcher()

    func fetchLocations() async throws -> [Location] {
        let data = try await fetchData()
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations
    }

    func configureResponse(data: Data) {
        self.data = data
    }

    private func fetchData() async throws -> Data {
        if let data = self.data {
            return data
        }
        let (data, _) = try await session.data(from: url)
        return data
    }
}
