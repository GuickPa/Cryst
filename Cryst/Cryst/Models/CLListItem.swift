//
//  CLListItem.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 25/07/22.
//

import Foundation

struct CLRoi: Codable {
    var times: Double
    var currency: String
    var percentage: Double
}

struct CLListItem: Codable {
    var id: String
    var symbol: String
    var name: String
    var image: String
    var current_price: Double
    var market_cap: Int
    var market_cap_rank: Int
    var fully_diluted_valuation: Double?
    var total_volume: Double
    var high_24h: Double
    var low_24h: Double
    var price_change_24h: Double
    var price_change_percentage_24h: Double
    var market_cap_change_24h: Double
    var market_cap_change_percentage_24h: Double
    var circulating_supply: Double?
    var total_supply: Double?
    var max_supply: Double?
    var ath: Double
    var ath_change_percentage: Double
    var ath_date: Date
    var atl: Double
    var atl_change_percentage: Double
    var atl_date: Date
    var roi: CLRoi?
    var last_updated: String
}
