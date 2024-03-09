//
//  ExploreViewModel.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import Foundation

protocol ExploreViewModelProtocol {
    func fetchListings() async
    func updateListingsForLocation()

}

class ExploreViewModel: ObservableObject, ExploreViewModelProtocol {
    @Published var listings = [Listing]()
    @Published var destination: String = ""
    private var listingsCopy = [Listing]()
    private let service: ExploreService

    init(service: ExploreService) {
        self.service = service
        Task { await fetchListings() }
    }

    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch {
            print("DEBUG: Failed to fetch listings with error : \(error.localizedDescription)")
        }
    }
    

    func updateListingsForLocation() {
        listings = listingsCopy
        let filteredListings = listings.filter({
            $0.city.lowercased() == destination.lowercased() ||
            $0.state.lowercased() == destination.lowercased()
        })

        self.listings = filteredListings.isEmpty ?  listingsCopy : filteredListings
    }
}
