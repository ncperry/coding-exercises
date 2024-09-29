//
//  location_attribute.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import Foundation

struct LocationAttribute: Decodable {
    let type: String
    let value: LocationAttributeValue
}
