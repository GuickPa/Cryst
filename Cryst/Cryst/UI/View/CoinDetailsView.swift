//
//  CoinDetailsView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import SwiftUI

struct CoinDetailsView: View {
    var coinId: String
    
    var body: some View {
        TabView {
            CoinDescriptionView(coinId: coinId)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            CoinDescriptionView(coinId: coinId)
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coinId: GDConst.defaultCoinId)
    }
}
