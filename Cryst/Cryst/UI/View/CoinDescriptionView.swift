//
//  CoinDescriptionView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import SwiftUI

struct CoinDescriptionView: View {
    @StateObject var coinViewModel = CoinDetailsViewModel(loader: GDDataLoader())
    var coinId: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing, spacing: 0) {
                Text(coinViewModel.item.description["en"]?.stripTags() ?? "no description")
                    .font(.system(size: 16))
                    .lineLimit(nil)
            }
            .padding(8)
        }
        .onAppear {
            coinViewModel.loadItem(itemId: coinId)
        }
    }
}

struct CoinDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDescriptionView(coinId: GDConst.defaultCoinId)
    }
}
