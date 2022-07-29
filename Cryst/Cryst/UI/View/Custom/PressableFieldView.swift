//
//  PressableFieldView.swift
//  Cryst
//
//  Created by Guglielmo Deletis on 29/07/22.
//

import SwiftUI

struct PressableFieldView: View {
    var title:String
    var content: String?
    var action: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            TitleText(text: title)
            ContentText(text: content)
                .foregroundColor(.blue)
            Image(systemName: "link")
                .resizable()
                .frame(width: 14, height: 14)
                .aspectRatio(contentMode: .fill)
        }
        .onTapGesture {
            action()
        }
    }
}

#if DEBUG
struct PressableFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PressableFieldView(
            title: GDConst.defaultTitle,
            content: GDConst.defaultContent,
            action: {
                _ = Alert(title: Text("OK!"))
            }
        )
    }
}
#endif
