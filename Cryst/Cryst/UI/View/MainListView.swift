//
//  MainListView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 25/07/22.
//

import SwiftUI

struct MainListView: View {
    @StateObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            List(listViewModel.items, id: \.id) {
                item in
                NavigationLink {
                    CoinDetailsView(coinId: item.id)
                } label: {
                    CoinListItemView(image: item.image, name: item.name, price: item.current_price)
                }
            }
            .onAppear {
                listViewModel.loadItems()
            }
            .navigationTitle("")
        }
    }
}

#if DEBUG
struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView(listViewModel: PreviewListViewModel())
    }
}
#endif
