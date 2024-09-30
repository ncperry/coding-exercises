//
//  LocationType.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
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

    var icon_name: String? {
        switch self {
        case .restaurant:
            return "restaurant_icon"
        case .bar:
            return "bar_icon"
        case .museum:
            return "museum_icon"
        case .park:
            return "park_icon"
        case .landmark:
            return "landmark_icon"
        case .cafe:
            return "cafe_icon"
        default:
            return nil
        }
    }
}
