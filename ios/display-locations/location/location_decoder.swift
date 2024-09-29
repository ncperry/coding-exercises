//
//  location_decoder.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import Foundation

class LocationDecoder {
    private static let NAME_KEY = "name"
    private static let DESCRIPTION_KEY = "description"
    private static let LOCATION_KEY = "location_type"
    private static let REVENUE_KEY = "estimated_revenue_millions"

    static func decodeNameFrom(attributes: [LocationAttribute]) throws -> String {
        try decodeStringFrom(attributes: attributes, for: NAME_KEY)
    }

    static func decodeDescriptionFrom(attributes: [LocationAttribute]) throws -> String {
        try decodeStringFrom(attributes: attributes, for: DESCRIPTION_KEY)
    }

    static func decodeTypeFrom(attributes: [LocationAttribute]) throws -> LocationType {
        guard let typeAttribute = attributes.first(where: { $0.type == LOCATION_KEY }) else {
            throw LocationDecodingError.attributeNotFound(LOCATION_KEY)
        }
        guard case .string(let typeValue) = typeAttribute.value,
              let locationType = LocationType(rawValue: typeValue) else {
            throw LocationDecodingError.mismatchedAttribute(LOCATION_KEY)
        }

        return locationType
    }

    static func decodeRevenueFrom(attributes: [LocationAttribute]) throws -> Double {
        guard let revenueAttribute = attributes.first(where: { $0.type == REVENUE_KEY }) else {
            throw LocationDecodingError.attributeNotFound(REVENUE_KEY)
        }
        guard case .double(let value) = revenueAttribute.value else {
            throw LocationDecodingError.mismatchedAttribute(REVENUE_KEY)
        }

        return value
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

