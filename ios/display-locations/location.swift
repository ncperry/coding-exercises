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
}
