//
//  CoinPriceChartView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 27/07/22.
//

import SwiftUI

struct CoinPriceChartView: View {
    @StateObject var chartViewModel:ChartViewModel
    var coinId: String
    
    var body: some View {
        HStack {
            ForEach(chartViewModel.normalizedValues, id: \.self) { value in
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 20, height: CGFloat(value.normalizedValue) * geometry.size.height * 0.5)
                            Text(GDConst.formatPrice(price: value.originalValue))
                            .font(.system(size: 11))
                            .rotationEffect(.degrees(-90))
                            .offset(y: 35)
                            .lineLimit(1)
                        }
                    }
                }
            }
        }
        .padding(8)
        .onAppear {
            chartViewModel.loadItem(itemId: coinId)
        }
    }
}

#if DEBUG
class DebugCharViewModel: ChartViewModel {
    override func loadItem(itemId: String) {
        self.item = CLItemMarketChart(prices: [
            [20000, 20000],
            [30000, 30000],
            [50000, 50000],
            [40000, 40000],
            [20000, 20000],
            [30000, 30000],
            [50000, 50000]
        ])
        self.normalizeValues()
    }
}

struct CoinPriceChartView_Previews: PreviewProvider {
    static var previews: some View {
        CoinPriceChartView(chartViewModel: DebugCharViewModel(), coinId: GDConst.defaultCoinId)
    }
}
#endif
