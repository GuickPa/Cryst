//
//  RemoteImageViewModel.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import Foundation
import UIKit

class ImageViewModel: ObservableObject {
    @Published var image: UIImage = UIImage()
    @Published var loading: Bool = false
    
    func loadImage(url:String) {
        
    }
}

class RemoteImageViewModel: ImageViewModel {
    private var loader:GDLoader
    
    init(loader:GDLoader) {
        self.loader = loader
        super.init()
        self.loader.delegate = self
    }
    
    override func loadImage(url:String) {
        if let _ = URL(string: url) {
            self.loader.load(urlString: url, handler: GDOperationQueueManager.instance)
            self.loading = true
        }
    }
}

extension RemoteImageViewModel {
    private func parseImage(data: Data) {
        DispatchQueue.main.async {
            if let image = UIImage(data: data) {
                self.image = image
            } else {
                self.loadDefault()
            }
            self.loading = false
        }
    }
    
    private func onLoadingError(error: Error?) {
        DispatchQueue.main.async {
            self.loadDefault()
            self.loading = false
        }
    }
    
    private func loadDefault() {
        self.image = UIImage()
    }
}


extension RemoteImageViewModel: GDLoaderDelegate {
    func loaderDidStart(_ loader: GDLoader) {
        
    }
    
    func loaderDidLoad(_ loader: GDLoader, data: [Data]?) {
        if let d = data?[0] {
            self.parseImage(data: d)
        }
    }

    func loaderFailed(_ loader: GDLoader, error: Error) {
        self.onLoadingError(error: error)
    }
    
    func loaderCancelled(_ loader: GDLoader) {
        self.onLoadingError(error: nil)
    }
}
