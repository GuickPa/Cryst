//
//  LoadingView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 30/07/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.6)
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
