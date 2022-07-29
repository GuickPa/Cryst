//
//  FieldView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 29/07/22.
//

import SwiftUI

struct FieldView: View {
    var title:String
    var content: String?
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            TitleText(text: title)
            ContentText(text: content)
        }
    }
}

#if DEBUG
struct FieldView_Previews: PreviewProvider {
    static var previews: some View {
        FieldView(title: GDConst.defaultTitle, content: GDConst.defaultContent)
    }
}
#endif
