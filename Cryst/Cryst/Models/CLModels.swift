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

struct CLItemLink: Codable {
    var homepage: [String]
}

struct CLItem: Codable {
    var id: String
    var symbol: String
    var name: String
    var hashing_algorithm: String?
    var block_time_in_minutes: Double
    var categories: [String]
    var description: [String: String]
    var links: CLItemLink
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
            links: CLItemLink(homepage: []),
            image: CLItemImage(thumb: GDConst.emptyString, small: GDConst.emptyString, large: GDConst.emptyString),
            last_updated: GDConst.formatDate(date: Date()))
    }
    
    static func defaultItem() -> CLItem {
        return CLItem(
            id: GDConst.defaultCoinId,
            symbol: GDConst.defaultCoinId,
            name: GDConst.defaultCoinId.capitalized,
            hashing_algorithm: GDConst.defaultCoinAlgorithm,
            block_time_in_minutes: 10.0,
            categories: [],
            description: [GDConst.defaultLanguage: GDConst.defaultLoremIpsum],
            links: CLItemLink(homepage: []),
            image: CLItemImage(thumb: GDConst.listItemImagePlaceholder, small: GDConst.listItemImagePlaceholder, large: GDConst.listItemImagePlaceholder),
            last_updated: GDConst.formatDate(date: Date()))
    }
}

struct CLItemMarketChart: Codable {
    var prices: [[Double]]
    
    static func empty() -> CLItemMarketChart {
        return CLItemMarketChart(prices: [])
    }
}
