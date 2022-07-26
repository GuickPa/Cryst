//
//  CoinListViewModel.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 25/07/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [CLListItem] = []
    @Published var loading: Bool = false
    
    func loadItems() {
        
    }
}

class CoinListViewModel: ListViewModel  {
    private var loader:GDLoader
    
    init(loader:GDLoader) {
        self.loader = loader
        super.init()
        self.loader.delegate = self
    }
    
    override func loadItems() {
        self.loader.load(urlString: GDConst.listURLString, handler: GDOperationQueueManager.instance)
        self.loading = true
    }
}

extension CoinListViewModel {
    private func parseList(data:Data) {
        DispatchQueue.main.async {
            self.items = GDGenericDataDecoder().decode(data: data, classType: [CLListItem].self) ?? []
            self.loading = false
        }
    }
    
    private func onLoadingError(error: Error?) {
        self.loading = false
    }
}

extension CoinListViewModel: GDLoaderDelegate {
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
