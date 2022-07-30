//
//  RemoteImageView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import SwiftUI

struct RemoteImageView: View {
    @StateObject var remoteImageViewModel: ImageViewModel
    var imageURL: String
    
    var body: some View {
        ZStack {
            Image(uiImage: remoteImageViewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(.gray, lineWidth: 3)
                )
            if remoteImageViewModel.loading {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .onAppear {
            remoteImageViewModel.loadImage(url: imageURL)
        }
    }
}

#if DEBUG
class DebugImageViewModel: ImageViewModel {
    override func loadImage(url: String) {
        self.image = UIImage(named: GDConst.listItemImagePlaceholder)!
        self.loading = false
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(remoteImageViewModel: DebugImageViewModel(), imageURL: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")
    }
}
#endif
