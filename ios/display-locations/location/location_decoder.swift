//
//  location_decoder.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import Foundation

class LocationDecoder {
    static func decodeTypeFrom(attributes: [LocationAttribute]) throws -> LocationType {
        guard let typeAttribute = attributes.first(where: { $0.type == "location_type" }) else {
            throw LocationDecodingError.attributeNotFound("location_type")
        }
        guard case .string(let typeValue) = typeAttribute.value,
              let locationType = LocationType(rawValue: typeValue) else {
            throw LocationDecodingError.mismatchedAttribute("location_type")
        }

        return locationType
    }

    static func decodeStringFrom(attributes: [LocationAttribute], for key: String) throws -> String {
        guard let attributeForKey = attributes.first(where: { $0.type == key }) else {
            throw LocationDecodingError.attributeNotFound(key)
        }
        guard case .string(let value) = attributeForKey.value else {
            throw LocationDecodingError.mismatchedAttribute(key)
        }

        return value
    }

    static func decodeRevenueFrom(attributes: [LocationAttribute]) throws -> Double {
        guard let revenueAttribute = attributes.first(where: { $0.type == "estimated_revenue_millions" }) else {
            throw LocationDecodingError.attributeNotFound("estimated_revenue_millions")
        }
        guard case .double(let value) = revenueAttribute.value else {
            throw LocationDecodingError.mismatchedAttribute("estimated_revenue_millions")
        }

        return value
    }
}

