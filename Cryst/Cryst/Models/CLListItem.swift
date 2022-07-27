//
//  CLListItem.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 25/07/22.
//

import Foundation

// MARK: item models
struct CLListItem: Codable {
    var id: String
    var symbol: String
    var name: String
    var image: String
    var current_price: Double
}

// MARK: details models
struct CLItemImage: Codable {
    var thumb: String
    var small: String
    var large: String
}

struct CLItem: Codable {
    var id: String
    var symbol: String
    var name: String
    var hashing_algorithm: String?
    var block_time_in_minutes: Double
    var categories: [String]
    var description: [String: String]
    var image: CLItemImage
    var last_updated: String
    
    static func empty() -> CLItem {
        return CLItem(
            id: "",
            symbol: "",
            name: "",
            hashing_algorithm: "",
            block_time_in_minutes: 0.0,
            categories: [],
            description: [:],
            image: CLItemImage(thumb: GDConst.listItemImagePlaceholder, small: GDConst.listItemImagePlaceholder, large: GDConst.listItemImagePlaceholder),
            last_updated: GDConst.formatDate(date: Date()))
    }
}
