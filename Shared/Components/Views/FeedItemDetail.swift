//
//  FeedItemDetail.swift
//  SwiftUI_1
//
//  Created by Mykola Bibikov on 11.03.2022.
//

import SwiftUI

struct FeedItemDetail: View {
    
    var namespace: Namespace.ID
    @Binding var isShow: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            Button(action: {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                    isShow.toggle()
                }
            }) {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .padding(.top, 20)
            .ignoresSafeArea()
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image("Illustration 9")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: kImageKey, in: namespace)
        )
        .background(
            Image("Background 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: kBackgroundKey, in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: kMaskKey, in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: kTitleKey, in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("some needed info description 20 - 12".uppercased())
                    .matchedGeometryEffect(id: kSubheaderKey, in: namespace)
                    .font(.footnote.weight(.semibold))
                Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using")
                    .font(.footnote)
                    .matchedGeometryEffect(id: kFootnoteKey, in: namespace)
                Divider()
                HStack {
                    Image("Avatar Default")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .strokeStyle(cornerRadius: 18)
                    Text("Author info")
                        .font(.footnote)
                    }
                }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: kBlurKey, in: namespace)
                )
                .offset(y: 250)
                .padding(20)
        )
    }
}

struct FeedItemDetail_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        FeedItemDetail(namespace: namespace, isShow: .constant(true))
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
