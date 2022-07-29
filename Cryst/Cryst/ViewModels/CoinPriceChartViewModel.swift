//
//  CoinPriceChartViewModel.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 27/07/22.
//

import Foundation
import SwiftUI

struct ChartNormalizedValue: Hashable {
    var index: Int
    var value: Double
    var x: CGFloat
    var y: CGFloat
}

class ChartViewModel: ObservableObject {
    @Published var item: CLItemMarketChart = CLItemMarketChart.empty()
    @Published var loading: Bool = false
    
    var normalizedValues: [ChartNormalizedValue] = []
    
    func loadItem(itemId: String) {
        
    }
    
    // Normalizes values on maximum value in list
    func normalizeValues () {
        // get the maximum value
        if self.item.prices.count > 0, let maxItem = self.item.prices.max(by: { $0[1] < $1[1] }), let minItem = self.item.prices.min(by: { $0[1] < $1[1] }) {
            let max = maxItem[1]
            let min = minItem[1]
            let delta = max - min
            let count:CGFloat = CGFloat(self.item.prices.count - 1)
            // reset normalized value
            self.normalizedValues = []
            // save list with each value on max value
            for (index, item) in self.item.prices.enumerated() {
                let y = ((item[1] - min) / delta) + 0.1
                self.normalizedValues.append(
                    ChartNormalizedValue(
                        index: index,
                        value: item[1],
                        x: CGFloat(index)/count,
                        y: y
                    )
                )
            }
            // closing point
            self.normalizedValues.append(ChartNormalizedValue(
                index: -1,
                value: 0,
                x: 1,
                y: 0
            ))
        }
    }
}

class CoinPriceChartViewModel: ChartViewModel {
    private var loader:GDLoader
    
    init(loader:GDLoader) {
        self.loader = loader
        super.init()
        self.loader.delegate = self
    }
    
    override func loadItem(itemId: String) {
        let urlString = String(format: GDConst.marketChartURLString, itemId)
        self.loader.load(urlString: urlString, handler: GDOperationQueueManager.instance)
        self.loading = true
    }
}

extension CoinPriceChartViewModel {
    private func parseList(data:Data) {
        DispatchQueue.main.async {
            self.item = GDGenericDataDecoder().decode(data: data, classType: CLItemMarketChart.self) ?? CLItemMarketChart.empty()
            // load normalized value after loading
            self.normalizeValues()
            self.loading = false
        }
    }
    
    private func onLoadingError(error: Error?) {
        DispatchQueue.main.async {
            self.loading = false
        }
    }
}

extension CoinPriceChartViewModel: GDLoaderDelegate {
    func loaderDidStart(_ loader: GDLoader) {
        
    }
    
    func loaderDidLoad(_ loader: GDLoader, data: [Data]?) {
        if let d = data?[0] {
            self.parseList(data: d)
        }
    }
    
    func loaderFailed(_ loader: GDLoader, error: Error) {
        self.onLoadingError(error: error)
    }
    
    func loaderCancelled(_ loader: GDLoader) {
        self.onLoadingError(error: nil)
    }
}
