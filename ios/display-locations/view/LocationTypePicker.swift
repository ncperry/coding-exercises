//
//  LocationTypePicker.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import SwiftUI

struct LocationTypePicker: View {
    @ObservedObject var filters: Filters

    var body: some View {
        Menu("Location Types") {
            ForEach(LocationType.displayedCases(), id: \.self) { locationType in
                Toggle(isOn: filters.binding(for: locationType)) {
                    Text(locationType.label)
                }
            }
        }
        .foregroundStyle(.black)
        .menuActionDismissBehavior(.disabled)
    }
}

#Preview {
    LocationTypePicker(filters: Filters())
}
