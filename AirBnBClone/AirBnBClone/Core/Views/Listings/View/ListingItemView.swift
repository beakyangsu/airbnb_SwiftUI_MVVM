//
//  ListingItemView.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

//골조부터 만드느거지

import SwiftUI

struct ListingItemView: View {
    let listItem: Listing

    var body: some View {
        VStack(spacing: 8) {
            // image list view
            ImageTabView(images: listItem.imageUrls)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            //listing details
            HStack(alignment:.top) {
                //details
                VStack(alignment: .leading) {
                    Text(listItem.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text(listItem.address)
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)

                    HStack(spacing:4) {
                        Text("\(listItem.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.black)
                    }
                }
                Spacer()

                //rating
                RatingView(listItem: listItem)

            }
            .font(.footnote)

        }
        .padding()

    }
}

#Preview {
    ListingItemView(listItem: DeveloperPreview.shared.listings[0])
}
