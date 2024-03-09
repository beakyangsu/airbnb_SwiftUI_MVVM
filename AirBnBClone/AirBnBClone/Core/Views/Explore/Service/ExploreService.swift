//
//  ExploreService.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import Foundation

//this is mock service 
class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
