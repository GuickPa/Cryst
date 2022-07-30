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
        ZStack {
            ScrollView {
                VStack (alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            FieldView(
                                title: GDConst.localizedString("coin_description_name"),
                                content: coinViewModel.item.name)
                            
                            FieldView(
                                title: GDConst.localizedString("coin_description_symbol"),
                                content: coinViewModel.item.symbol)
                            
                            FieldView(
                                title: GDConst.localizedString("coin_description_algorithm"),
                                content: coinViewModel.item.hashing_algorithm)
                            
                            PressableFieldView(
                                title: GDConst.localizedString("coin_description_url"),
                                content: coinViewModel.itemLink,
                                action: {
                                    coinViewModel.openCoinLink()
                                })
                        }
                        Spacer()
                        // TODO: find a better and solid solution for this -> image won't updates after item was loaded
                        if coinViewModel.itemImage.count > 0 {
                            RemoteImageView(
                                remoteImageViewModel: RemoteImageViewModel(loader: GDDataLoader()),
                                imageURL: coinViewModel.itemImage
                            )
                        } else {
                            RemoteImageView(
                                remoteImageViewModel: RemoteImageViewModel(loader: GDDataLoader()),
                                imageURL: coinViewModel.itemImage
                            )
                        }
                        Spacer()
                    }
                    Spacer()
                    TitleText(text: GDConst.localizedString("coin_description_description"))
                    ContentText(text: coinViewModel.itemDescription)
                }.padding(8)
            }
            if(coinViewModel.loading) {
                LoadingView()
            }
        }
        .onAppear {
            coinViewModel.loadItem(itemId: coinId)
        }
    }
}

#if DEBUG
class DebugDetailsViewModel: DetailsViewModel {
    override func loadItem(itemId: String) {
        self.loading = false
        self.item = CLItem.defaultItem()
    }
}

struct CoinDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDescriptionView(coinViewModel: DebugDetailsViewModel(), coinId: GDConst.defaultCoinId)
    }
}
#endif
