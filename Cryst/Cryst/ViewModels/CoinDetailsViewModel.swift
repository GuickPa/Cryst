//
//  CoinDetailsViewModel.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import Foundation

class CoinDetailsViewModel: ObservableObject {
    @Published var coin: CLListItem
    
    init(coin: CLListItem) {
        self.coin = coin
    }
}
