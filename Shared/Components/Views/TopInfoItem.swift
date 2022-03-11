//
//  TopInfoItem.swift
//  SwiftUI_1
//
//  Created by Mykola Bibikov on 10.03.2022.
//

import SwiftUI

struct TopInfoItem: View {
    
    var model: TopInfoModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image(model.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 32.0, height: 32.0)
                .cornerRadius(10.0)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous) )
                .strokeStyle(cornerRadius: 16)
            
            Text(model.title)
                .font(.title)
                .fontWeight(.black)
                .lineLimit(1)
                .opacity(0.7)
            Text(model.subtitle.uppercased())
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text(model.text)
                .foregroundStyle(.secondary)
                .font(.footnote)
                .lineLimit(2)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 20.0)
        .frame(height: 300.0)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
        .padding(.horizontal, 20.0)
        
    }
}

struct Previews_FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        TopInfoItem(model: topInfoItems[0])
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
    }
}
