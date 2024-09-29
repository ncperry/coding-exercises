//
//  location_decoding_error.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import Foundation

enum LocationDecodingError: Error {
    case attributeNotFound(String)
    case mismatchedAttribute(String)
}
