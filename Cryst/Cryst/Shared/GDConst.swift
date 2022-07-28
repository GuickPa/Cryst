//
//  GDConst.swift
//  BaseApp
//
//  Created by Guglielmo Deletis on 20/04/22.
//

import Foundation
import UIKit

class GDConst {
    static let baseURLString = "https://api.coingecko.com/api/v3"
    static let listURLString = "\(GDConst.baseURLString)/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=10&page=1"
    static let detailsURLString = "\(GDConst.baseURLString)/coins/%@"
    static let marketChartURLString = "\(GDConst.baseURLString)/coins/%@/market_chart?vs_currency=eur&days=7&interval=daily"
    
    static let defaultDateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    // colors
    static let defaultBackgroundColor = UIColor(hexString: "A5C4D4")
    
    // generic messages
    static let messageUnknown = GDConst.localizedString("gd_message_unknown")
    
    // placeholders
    static let listItemImagePlaceholder = "cryptoPlaceholder"
    static let defaultCoinId = "bitcoin"
    
    static func localizedString (_ title: String) -> String {
      return NSLocalizedString(title, comment: "")
    }
    
    static func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = GDConst.defaultDateFormat
        return dateFormatter.string(from: date)
    }
    
    static func formatPrice(price: Double) -> String {
        return String(format: "%.2f €", price)
    }
}
