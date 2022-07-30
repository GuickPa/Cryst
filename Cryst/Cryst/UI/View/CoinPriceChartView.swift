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
        ZStack {
            VStack {
                VStack {
                    Text("Last 7 days prices")
                    Spacer()
                }
                GeometryReader { geometry in
                    ZStack {
                        let path = Path {
                            path in
                            path.move(to: CGPoint(x:0, y:geometry.size.height))
                            for value in chartViewModel.normalizedValues {
                                path.addLine(to: CGPoint(
                                    x: value.x * geometry.size.width,
                                    y: geometry.size.height - (value.y * geometry.size.height)
                                ))
                            }
                            path.closeSubpath()
                        }
                        path.fill(LinearGradient(gradient: Gradient(colors: [.blue, .green]),
                                                 startPoint: .top,
                                                 endPoint: .bottom))
                    }
                    ForEach(chartViewModel.normalizedValues, id: \.self) { value in
                        if value.index >= 0 {
                            Text(GDConst.formatPrice(price: value.value))
                                .position(x: value.x * geometry.size.width,
                                          y: geometry.size.height - (value.y * geometry.size.height)
                                )
                                .font(.system(size: 9))
                                .lineLimit(1)
                        }
                    }
                }
                
            }
            .padding(16)
            if(chartViewModel.loading) {
                LoadingView()
            }
        }
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
            [20000, 20000],
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
