//
//  DebugListViewModel.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import Foundation

#if DEBUG
class PreviewListViewModel: ListViewModel {
    override init() {
        super.init()
        self.items = [
            CLListItem(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", current_price: 150),
            CLListItem(id: "ethereum", symbol: "eth", name: "Ethereum", image: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880", current_price: 50),
            CLListItem(id: "tether", symbol: "usdt", name: "Tether", image: "https://assets.coingecko.com/coins/images/325/large/Tether-logo.png?1598003707", current_price: 25)
        ]
    }
}
#endif
