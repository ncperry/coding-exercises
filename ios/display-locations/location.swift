//
//  location.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import Foundation

struct LocationAttribute: Decodable {
    let type: String

}

struct Location: Decodable {
    let id: Int
    let latitude: Float
    let longitude: Float
    let attributes: [LocationAttribute]
}
