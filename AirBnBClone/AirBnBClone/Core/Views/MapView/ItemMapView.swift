//
//  ItemMapView.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import SwiftUI
import MapKit

struct ItemMapView: View {
    @State private var cameraPosition: MapCameraPosition
    let listItem : Listing

    init(listItem: Listing) {
        self.listItem = listItem
        
        let location = CLLocationCoordinate2D(
            latitude: listItem.latitue,
            longitude: listItem.longitude)

        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        self._cameraPosition = State(initialValue: .region(region))
    }

    var body: some View {
        Map(position: $cameraPosition)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ItemMapView(listItem: DeveloperPreview.shared.listings[0])
}
