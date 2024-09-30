//
//  ContentView.swift
//  display-locations
//
//  Created by Nathan Perry on 9/28/24.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @ObservedObject var filters = Filters()
    @State private var selection: Int?
    @State private var presentDetail: Bool = false
    @State private var displayError: Bool = false

    var body: some View {
        VStack {
            LocationTypePicker(filters: filters)
            MapView(filters: filters, selection: $selection, presentDetail: $presentDetail)
        }
        .onAppear {
            Task {
                let fetcher = LocationFetcher.shared
                do {
                    filters.locations = try await fetcher.fetchLocations()
                } catch {
                    self.displayError = true
                }
            }
        }
        .sheet(isPresented: $presentDetail, content: {
            selectedLocation().map { selectedLocation in
                LocationDetailView(presentedAsModal: self.$presentDetail, selection: $selection, location: selectedLocation)
            }
        })
        .onChange(of: selection) {
            presentDetail = selection != nil
        }
        .alert("Failed to load locations. Please contact support.", isPresented: $displayError) {
            Button("Ok", role: .cancel) {
                displayError = false
            }
        }
    }

    private func selectedLocation() -> Location? {
        filters.locations.first(where: { $0.id == selection })
    }
}

#Preview {
    ContentView()
}
