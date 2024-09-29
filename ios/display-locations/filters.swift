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
    @Published var filters: Dictionary<LocationType, Bool> = [:]

    init() {
        LocationType.displayedCases().forEach({ type in
            filters[type] = true
        })
    }

    var keys: [LocationType] {
        LocationType.allCases
    }

    func binding(for key: LocationType) -> Binding<Bool> {
        return Binding(get: {
            return self.filters[key] ?? false
        }, set: {
            self.filters[key] = $0
        })
    }
}
