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
            CoinDescriptionView(coinViewModel: CoinDescriptionViewModel(loader: GDDataLoader()), coinId: coinId)
                .tabItem {
                    Label(GDConst.localizedString("details_tab_view_title"), systemImage: "list.dash")
                }
                .navigationBarTitle("")

            CoinPriceChartView(chartViewModel: CoinPriceChartViewModel(loader: GDDataLoader()), coinId: coinId)
                .tabItem {
                    Label(GDConst.localizedString("price_chart_tab_view_title"), systemImage: "square.and.pencil")
                }
                .navigationBarTitle("")
        }
    }
}

#if DEBUG
struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coinId: GDConst.defaultCoinId)
    }
}
#endif
