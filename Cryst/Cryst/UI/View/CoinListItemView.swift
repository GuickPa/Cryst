//
//  CoinListItem.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 25/07/22.
//

import SwiftUI

struct CoinListItemView: View {
    var image: String
    var name: String
    var price: Double
    
    var body: some View {
        HStack {
            RemoteImageView(imageURL: image)
            VStack(alignment: .leading) {
                Text(name)
                Text(GDConst.formatPrice(price: price))
                
            }
        }
        .padding(8)
    }
}

#if DEBUG
struct CoinListItem_Previews: PreviewProvider {
    static var previews: some View {
        CoinListItemView(
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
            name: "Bitcoin",
            price: 150.0
        )
    }
}
#endif
