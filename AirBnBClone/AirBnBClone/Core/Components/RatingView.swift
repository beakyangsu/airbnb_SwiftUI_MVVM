//
//  RatingView.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

struct RatingView: View {
    var listItem: Listing
    var body: some View {
        
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .foregroundStyle(.black)
            Text(String(format: "%.2f", listItem.rating))
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    RatingView(listItem: DeveloperPreview.shared.listings[0])
}
