//
//  SearchAndFilterBar.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var destination: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            VStack(alignment:.leading, spacing:2) {
                Text(destination.isEmpty ? "Where to?" : destination)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Anywhere - Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }

            Spacer()

            Button {

            }label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius:2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(destination: .constant(""))
}
