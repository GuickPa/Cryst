//
//  CoinDetailsViewModel.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import Foundation
import UIKit

class DetailsViewModel: ObservableObject {
    @Published var item: CLItem = CLItem.empty()
    @Published var loading: Bool = false
    
    var itemDescription: String {
        get {
            return self.item.description[GDConst.defaultLanguage]?.stripTags() ?? "no description"
        }
    }
    
    var itemImage: String {
        get {
            return self.item.image.large
        }
    }
    
    var itemLink: String? {
        get {
            if self.item.links.homepage.count > 0 {
                return self.item.links.homepage[0]
            }
            return nil
        }
    }
    
    func loadItem(itemId: String) {
        
    }
    
    func openCoinLink() {
        if let link = self.itemLink, let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

class CoinDescriptionViewModel: DetailsViewModel {
    private var loader:GDLoader
    
    init(loader:GDLoader) {
        self.loader = loader
        super.init()
        self.loader.delegate = self
    }
    
    override func loadItem(itemId: String) {
        let urlString = String(format: GDConst.detailsURLString, itemId)
        self.loader.load(urlString: urlString, handler: GDOperationQueueManager.instance)
        self.loading = true
    }
}

extension CoinDescriptionViewModel {
    private func parseData(data:Data) {
        DispatchQueue.main.async {
            self.item = GDGenericDataDecoder().decode(data: data, classType: CLItem.self) ?? CLItem.empty()
            self.loading = false
        }
    }
    
    private func onLoadingError(error: Error?) {
        DispatchQueue.main.async {
            self.loading = false
        }
    }
}

extension CoinDescriptionViewModel: GDLoaderDelegate {
    func loaderDidStart(_ loader: GDLoader) {
        
    }
    
    func loaderDidLoad(_ loader: GDLoader, data: [Data]?) {
        if let d = data?[0] {
            self.parseData(data: d)
        }
    }
    
    func loaderFailed(_ loader: GDLoader, error: Error) {
        self.onLoadingError(error: error)
    }
    
    func loaderCancelled(_ loader: GDLoader) {
        self.onLoadingError(error: nil)
    }
}
