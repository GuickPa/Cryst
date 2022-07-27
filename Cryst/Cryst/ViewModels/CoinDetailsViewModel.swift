//
//  CoinDetailsViewModel.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import Foundation

class DetailsViewModel: ObservableObject {
    @Published var item: CLItem = CLItem.empty()
    @Published var loading: Bool = false
    
    var itemDescription: String {
        get {
            return self.item.description["en"]?.stripTags() ?? "no description"
        }
    }
    
    func loadItem(itemId: String) {
        
    }
}

class CoinDetailsViewModel: DetailsViewModel {
    private var loader:GDLoader
    
    init(loader:GDLoader) {
        self.loader = loader
        super.init()
        self.loader.delegate = self
    }
    
    override func loadItem(itemId: String) {
        let string = String(format: GDConst.detailsURLString, itemId)
        self.loader.load(urlString: string, handler: GDOperationQueueManager.instance)
        self.loading = true
    }
}

extension CoinDetailsViewModel {
    private func parseList(data:Data) {
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

extension CoinDetailsViewModel: GDLoaderDelegate {
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
