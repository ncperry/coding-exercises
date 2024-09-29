//
//  location.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import Foundation

enum LocationAttributeValue: Decodable, Equatable {
    case string(String)
    case float(Float)

    init(from decoder: Decoder) throws {
        do {
            self = .string(try decoder.singleValueContainer().decode(String.self))
        } catch DecodingError.typeMismatch {
            self = .float(try decoder.singleValueContainer().decode(Float.self))
        }
    }
}

struct LocationAttribute: Decodable {
    let type: String
    let value: LocationAttributeValue
}

struct Location: Decodable {
    let id: Int
    let latitude: Float
    let longitude: Float
    let attributes: [LocationAttribute]
}
