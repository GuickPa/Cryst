//
//  CoinDescriptionView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import SwiftUI

struct CoinDescriptionView: View {
    @StateObject var coinViewModel:DetailsViewModel
    var coinId: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing, spacing: 0) {
                Text(coinViewModel.itemDescription)
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

#if DEBUG
struct CoinDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDescriptionView(coinViewModel: CoinDetailsViewModel(loader: GDDataLoader()), coinId: GDConst.defaultCoinId)
    }
}
#endif
