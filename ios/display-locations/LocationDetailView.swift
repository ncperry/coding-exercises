//
//  LocationDetailView.swift
//  display-locations
//
//  Created by Nathan Perry on 9/29/24.
//

import SwiftUI

struct LocationDetailView: View {
    @Binding var presentedAsModal: Bool
    var location: Location
    private let horizontalPadding: CGFloat = 24

    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.title)
                        .padding(.bottom)
                        .padding(.top)
                        .padding([.leading, .trailing], horizontalPadding)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(location.type.label)
                        .foregroundStyle(.gray)
                        .padding(.bottom, 3)
                        .padding([.leading, .trailing], horizontalPadding)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(location.description)
                        .padding([.leading, .trailing], horizontalPadding)
                        .padding(.bottom)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Estimated Yearly Revenue $" + location.estimatedRevenueMillions.description + "M")
                        .font(.system(size: 14, design: .monospaced))
                        .padding([.leading, .trailing], horizontalPadding)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .toolbar {
                    Button("Dismiss") {
                        self.presentedAsModal = false
                    }
                }
                .padding([.leading, .trailing], 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
                .accentColor(Color.black)
                .background(.white)
            }
        }
    }
}

#Preview {
    LocationDetailView(
        presentedAsModal: Binding.constant(true),
        location: Location.init(
            id: 0,
            latitude: 0,
            longitude: 0,
            name: "Golden Gate Grill but Like With a Really Long Title That Will Wrap a Few Times",
            type: .restaurant,
            description: "A popular eatery with views of the bay. You'll probably see a few elephant seals. The lights over in Sausilito.",
            estimatedRevenueMillions: 10.5
        )
    )
}
