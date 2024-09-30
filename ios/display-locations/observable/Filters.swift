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
            categorizeLocations()
            calculateVisibleLocations()
        }
    }
    private var locationsByType = Dictionary<LocationType, [Location]>()
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

    private func categorizeLocations() {
        locationsByType = Dictionary.init(grouping: locations, by: { $0.type })
    }

    private func calculateVisibleLocations() {
        visibleLocations = filters.keys.filter({ key in
            return filters[key] ?? false
        }).reduce(into: [Location]()) { accumlator, type in
            if let locationsMatchingType = locationsByType[type] {
                accumlator.append(contentsOf: locationsMatchingType)
            }
        }
    }
}
