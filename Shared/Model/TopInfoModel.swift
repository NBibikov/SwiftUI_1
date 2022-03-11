//
//  TopInfoModel.swift
//  SwiftUI_1
//
//  Created by Mykola Bibikov on 10.03.2022.
//

import Foundation

struct TopInfoModel: Identifiable {
    
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var logo: String
}

var topInfoItems = [
    TopInfoModel(title: "God bless Ukraine 1 🇺🇦 praying", subtitle: "Subtitle some text 1", text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", image: "Illustration 1", logo: "Logo 1"),
    TopInfoModel(title: "Some title 2", subtitle: "Subtitle some text 2", text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", image: "Illustration 2", logo: "Logo 2"),
    TopInfoModel(title: "Some title 3", subtitle: "Subtitle some text 3", text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", image: "Illustration 3", logo: "Logo 3"),
    TopInfoModel(title: "Some title 4", subtitle: "Subtitle some text 4", text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", image: "Illustration 4", logo: "Logo 4"),
]
