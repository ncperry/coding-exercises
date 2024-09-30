//
//  location.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import Foundation

struct Location: Decodable, Identifiable {
    let id: Int
    let latitude: Double
    let longitude: Double
    let name: String
    let type: LocationType
    let description: String
    let estimatedRevenueMillions: Double

    enum CodingKeys: String, CodingKey {
        case id
        case latitude
        case longitude
        case name
        case type
        case description
        case estimatedRevenueMillions
        case attributes
    }
    
    init(id: Int, latitude: Double, longitude: Double, name: String, type: LocationType, description: String, estimatedRevenueMillions: Double) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.type = type
        self.description = description
        self.estimatedRevenueMillions = estimatedRevenueMillions
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)

        let attributes = try container.decode([LocationAttribute].self, forKey: .attributes)
        name = try LocationDecoder.decodeNameFrom(attributes: attributes)
        type = try LocationDecoder.decodeTypeFrom(attributes: attributes)
        description = try LocationDecoder.decodeDescriptionFrom(attributes: attributes)
        estimatedRevenueMillions = try LocationDecoder.decodeRevenueFrom(attributes: attributes)
    }
}
