//
//  FeedItem.swift
//  SwiftUI_1
//
//  Created by Mykola Bibikov on 11.03.2022.
//

import SwiftUI

let kTitleKey = "kTitleKey"
let kSubheaderKey = "kSubheaderKey"
let kFootnoteKey = "kFootnoteKey"
let kBackgroundKey = "kBackgroundKey"
let kMaskKey = "kMaskKey"
let kImageKey = "kImageKey"
let kBlurKey = "kBlurKey"

struct FeedItem: View {
    
    var namespace: Namespace.ID
    @Binding var isShow: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: kTitleKey, in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("some needed info description 20 - 12".uppercased())
                    .matchedGeometryEffect(id: kSubheaderKey, in: namespace)
                    .font(.footnote.weight(.semibold))
                
                Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using")
                    .matchedGeometryEffect(id: kFootnoteKey, in: namespace)
                    .font(.footnote)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: kBlurKey, in: namespace)
            )
        }
        .foregroundStyle(.white)
        .background(
            Image("Illustration 9")
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: kImageKey, in: namespace)
        )
        .background(
            Image("Background 5")
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: kBackgroundKey, in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: kMaskKey, in: namespace)
        )
        .frame(height: 300)
        .padding(20)
    }
}


struct FeedItem_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        FeedItem(namespace: namespace, isShow: .constant(false))
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
