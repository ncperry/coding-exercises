//
//  location_attribute_value.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
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
