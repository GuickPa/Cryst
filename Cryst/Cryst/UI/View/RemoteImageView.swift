//
//  RemoteImageView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 26/07/22.
//

import SwiftUI

struct RemoteImageView: View {
    @StateObject var remoteImageViewModel: RemoteImageViewModel = RemoteImageViewModel(loader: GDDataLoader())
    
    var imageURL: String
    
    var body: some View {
        Image(uiImage: remoteImageViewModel.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 64, height: 64, alignment: .center)
            .clipShape(Circle())
            .onAppear {
                remoteImageViewModel.loadImage(url: imageURL)
            }
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(imageURL: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")
    }
}
