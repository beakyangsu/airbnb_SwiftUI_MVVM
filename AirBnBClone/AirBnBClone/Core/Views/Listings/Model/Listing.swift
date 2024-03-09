//
//  Listing.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import Foundation

struct Listing : Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName : String
    let ownerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuest: Int
    let numberOfBeds: Int
    let latitue: Double
    let longitude: Double
    let address: String
    let city: String
    let state: String
    let title: String
    let type: ListingType


    //can change
    var rating: Double
    var pricePerNight: Int
    var features : [ListingFeature]
    var amenities : [ListingAmenities]
    var imageUrls: [String]

}


enum ListingFeature : Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost

    var id: Int { return self.rawValue }

    var title: String {
        switch self {
        case .selfCheckIn:  return "Self Check-In"
        case .superHost: return "Superhost"
        }
    }

    var subtitle: String {
        switch self {
        case .selfCheckIn:  
            return "Check yourself in with the keypad."
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are commited to providing greate stars for guests."
        }
    }

    var imageName: String {
        switch self {
        case .selfCheckIn:  return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }

}


enum ListingAmenities : Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony

    var id: Int { return self.rawValue }

    var title: String {
        switch self {
        case .pool:  return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "AlarmSystem"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }

    var imageName: String {
        switch self {
        case .pool:  return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
}


enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa

    var id: Int { return self.rawValue }

    var descripton: String {
        switch self {
        case .apartment:  return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town House"
        case .villa: return "Villa"
        }
    }
}
