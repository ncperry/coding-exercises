//
//  Filters.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import Foundation
import SwiftUI
import Combine

class Filters: ObservableObject {
    @Published var filters = Dictionary<LocationType, Bool>() {
        didSet {
            calculateVisibleLocations()
        }
    }
    @Published var locations = [Location]() {
        didSet {
            calculateVisibleLocations()
        }
    }
    @Published var visibleLocations = [Location]()

    init() {
        LocationType.displayedCases().forEach({ type in
            filters[type] = true
        })
    }

    func binding(for key: LocationType) -> Binding<Bool> {
        return Binding(get: {
            return self.filters[key] ?? false
        }, set: {
            self.filters[key] = $0
        })
    }

    func calculateVisibleLocations() {
        let visibleTypes = filters.keys.filter({ key in
            return filters[key] ?? false
        })
        visibleLocations = locations.filter({ location in
            return visibleTypes.contains(location.type)
        })
    }
}
