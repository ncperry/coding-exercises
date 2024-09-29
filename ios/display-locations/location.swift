//
//  location.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import Foundation

enum LocationType: String, CaseIterable {
    case restaurant
    case museum
    case park
    case landmark
    case cafe
    case bar
    case unknown

    var label: String {
        return rawValue.capitalized
    }

    static func displayedCases() -> [LocationType] {
        allCases.filter { $0 != .unknown }.sorted(by: { type1, type2 in
            type1.rawValue < type2.rawValue
        })
    }
}

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
        name = try Location.decodeStringFrom(attributes: attributes, for: "name")
        type = try Location.decodeTypeFrom(attributes: attributes)
        description = try Location.decodeStringFrom(attributes: attributes, for: "description")

        let revenueAttribute = attributes.first { $0.type == "estimated_revenue_millions" }
        if case .double(let revenueValue) = revenueAttribute?.value {
            estimatedRevenueMillions = revenueValue
        } else {
            estimatedRevenueMillions = 0
        }
    }

    private static func decodeTypeFrom(attributes: [LocationAttribute]) throws -> LocationType {
        guard let typeAttribute = attributes.first(where: { $0.type == "location_type" }) else {
            throw LocationDecodingError.attributeNotFound("location_type")
        }
        guard case .string(let typeValue) = typeAttribute.value,
              let locationType = LocationType(rawValue: typeValue) else {
            throw LocationDecodingError.mismatchedAttribute("location_type")
        }

        return locationType
    }

    private static func decodeStringFrom(attributes: [LocationAttribute], for key: String) throws -> String {
        guard let attributeForKey = attributes.first(where: { $0.type == key }) else {
            throw LocationDecodingError.attributeNotFound(key)
        }
        guard case .string(let value) = attributeForKey.value else {
            throw LocationDecodingError.mismatchedAttribute(key)
        }

        return value
    }
}
