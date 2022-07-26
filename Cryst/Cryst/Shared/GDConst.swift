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
    
    // colors
    static let defaultBackgroundColor = UIColor(hexString: "A5C4D4")
    
    // generic messages
    static let messageUnknown = GDConst.localizedString("gd_message_unknown")
    
    // placeholders
    static let listItemImagePlaceholder = "cryptoPlaceholder"
    
    static func localizedString (_ title: String) -> String {
      return NSLocalizedString(title, comment: "")
    }
}
