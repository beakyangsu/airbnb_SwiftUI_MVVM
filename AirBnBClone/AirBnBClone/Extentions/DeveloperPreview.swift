//
//  DeveloperPreview.swift
//  AirBnBClone
//
//  Created by yangsu.baek on 2024/03/09.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "1",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuest: 4,
            numberOfBeds: 4,
            latitue: 25.7850,
            longitude: -80.1936,
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            type: .villa,
            rating: 4.86,
            pricePerNight: 567,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi , .alarmSystem, .balcony, .laundry, .tv],
            imageUrls: ["11", "2", "6"]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Walker",
            ownerImageUrl: "2",
            numberOfBedrooms: 6,
            numberOfBathrooms: 3,
            numberOfGuest: 6,
            numberOfBeds: 8,
            latitue: 25.7850,
            longitude: -88.1936,
            address: "30 Main St",
            city: "Los Angeles",
            state: "California",
            title: "Beautiful California Pool Villa",
            type: .villa,
            rating: 4.96,
            pricePerNight: 800,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi ,.pool],
            imageUrls: ["10", "4", "5"]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Suzy",
            ownerImageUrl: "3",
            numberOfBedrooms: 1,
            numberOfBathrooms: 1,
            numberOfGuest: 6,
            numberOfBeds: 0,
            latitue: 29.7850,
            longitude: -80.1936,
            address: "124 Sub St",
            city: "Newyork",
            state: "Florida",
            title: "Good For Work",
            type: .apartment,
            rating: 4.3,
            pricePerNight: 417,
            features: [.selfCheckIn],
            amenities: [.wifi , .alarmSystem, .office],
            imageUrls: ["10", "11", "9"]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Kater",
            ownerImageUrl: "4",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuest: 4,
            numberOfBeds: 4,
            latitue: 60.7850,
            longitude: -80.1936,
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Super Luxury Town House",
            type: .townHouse,
            rating: 4.97,
            pricePerNight: 1203,
            features: [.superHost],
            amenities: [.wifi , .alarmSystem, .balcony, .laundry, .tv, .pool, .kitchen],
            imageUrls: ["6", "8", "7"]
        ),
    ]

}
