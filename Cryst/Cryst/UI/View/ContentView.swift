//
//  ContentView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 25/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainListView(listViewModel: CoinListViewModel(loader: GDDataLoader()))
    }
        
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView(listViewModel: PreviewListViewModel())
    }
}
#endif
