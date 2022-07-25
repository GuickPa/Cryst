//
//  MainListView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 25/07/22.
//

import SwiftUI

struct MainListView: View {
    @StateObject var listViewModel: CoinListViewModel = CoinListViewModel(loader: GDDataLoader())
    
    var body: some View {
        List(listViewModel.items, id: \.id) {
            item in
            Text(item.name).padding()
        }
        .onAppear {
            listViewModel.loadItems()
        }
    }
}

#if DEBUG
struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
#endif
