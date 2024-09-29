//
//  location.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import Foundation

enum LocationAttributeValue: Decodable, Equatable {
    case string(String)
    case double(Double)

    init(from decoder: Decoder) throws {
        do {
            self = .string(try decoder.singleValueContainer().decode(String.self))
        } catch DecodingError.typeMismatch {
            self = .double(try decoder.singleValueContainer().decode(Double.self))
        }
    }
}

enum LocationType: String, CaseIterable {
    case restaurant
    case museum
    case park
    case landmark
    case cafe
    case bar
    case unknown

    static func displayedCases() -> [LocationType] {
        allCases.filter { $0 != .unknown }
    }
}

struct LocationAttribute: Decodable {
    let type: String
    let value: LocationAttributeValue
}

struct Location: Decodable, Identifiable {
    let id: Int
    let latitude: Double
    let longitude: Double
    let attributes: [LocationAttribute]

    var name: String {
        let nameAttribute = attributes.first { $0.type == "name" }
        guard case .string(let nameValue) = nameAttribute?.value else {
            return ""
        }
        return nameValue
    }

    var type: LocationType {
        let typeAttribute = attributes.first { $0.type == "location_type" }
        guard case .string(let typeValue) = typeAttribute?.value else {
            return .unknown
        }
        guard let locationType = LocationType(rawValue: typeValue) else {
            return .unknown
        }
        return locationType
    }

    var description: String {
        let descriptionAttribute = attributes.first { $0.type == "description" }
        guard case .string(let descriptionValue) = descriptionAttribute?.value else {
            return ""
        }
        return descriptionValue
    }

    var estimatedRevenueMillions: Double {
        let revenueAttribute = attributes.first { $0.type == "estimated_revenue_millions" }
        guard case .double(let revenueValue) = revenueAttribute?.value else {
            return 0
        }
        return revenueValue
    }
}
