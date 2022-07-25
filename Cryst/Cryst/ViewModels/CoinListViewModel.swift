//
//  CoinListViewModel.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 25/07/22.
//

import Foundation

class CoinListViewModel: ObservableObject, GDLoaderDelegate {
    @Published var items: [CLListItem] = []
    @Published var loading: Bool = false
    
    private var loader:GDLoader
    
    func loadItems() {
        self.loader.load(urlString: GDConst.listURLString, handler: GDOperationQueueManager.instance)
        self.loading = true
    }
    
    required init(loader:GDLoader) {
        self.loader = loader
        self.loader.delegate = self
    }
}

extension CoinListViewModel {
    @MainActor
    private func parseList(data:Data) {
        self.items = GDGenericDataDecoder().decode(data: data, classType: [CLListItem].self) ?? []
    }
}

extension CoinListViewModel {
    func loaderDidStart(_ loader: GDLoader) {
        self.loading = true
    }
    
    @MainActor
    func loaderDidLoad(_ loader: GDLoader, data: [Data]?) {
        if let d = data?[0] {
            self.parseList(data: d)
        }
        self.loading = false
    }
    
    func loaderFailed(_ loader: GDLoader, error: Error) {
        self.loading = false
        self.items = []
    }
    
    func loaderCancelled(_ loader: GDLoader) {
        self.loading = false
        self.items = []
    }
}
