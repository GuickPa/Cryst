//
//  ContentText.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 29/07/22.
//

import SwiftUI

struct ContentText: View {
    var text:String?
    
    var body: some View {
        Text(text ?? "")
            .font(.system(size: GDConst.defaultContentFontSize))
    }
}

#if DEBUG
struct ContentText_Previews: PreviewProvider {
    static var previews: some View {
        ContentText(text: GDConst.defaultContent)
    }
}
#endif
