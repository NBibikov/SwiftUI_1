//
//  ContentView.swift
//  Shared
//
//  Created by Mykola Bibikov on 06.03.2022.
//

import SwiftUI

struct FeedView: View {
    
    @State var hasScrolled = false
    @Namespace var namespace
    @State var isShow = false
    
    
    let kScroll = "kFeedScroll"
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                scrollDetection
                topTabView
                
                if !isShow {
                    FeedItem(namespace: namespace, isShow: $isShow)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                isShow.toggle()
                            }
                        }
                }
            }
            .coordinateSpace(name: kScroll)
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", contentHasScrolled: $hasScrolled)
                    .environmentObject(NavigationModel())
            )
            if isShow {
                FeedItemDetail(namespace: namespace, isShow: $isShow)
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named(kScroll)).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation{
                hasScrolled = value < 0
            }
        })
    }
    
    var topTabView: some View {
        TabView {
            ForEach(topInfoItems) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    TopInfoItem(model: item)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 60))
                        .overlay(
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 170)
                                .offset(x: 40, y: -80)
                                .offset(x: minX)
                        )
                }
            }
        }
        .tabViewStyle(.page)
        .frame(height: 342)
        .background(Image("Blob 1").offset(x: 250, y: -110))
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
        FeedView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 13 mini")
    }
}
