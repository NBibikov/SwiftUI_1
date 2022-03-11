//
//  AccountView.swift
//  SwiftUI_1
//
//  Created by Mykola Bibikov on 08.03.2022.
//

import SwiftUI

struct AccounView: View {
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 20))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue.opacity(0.6), .blue)
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    BlobView()
                        .scaleEffect(1.1)
                        .offset(x: 10, y: -90)
                    
                )
                
            Text("Mykola")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                    
                Text("Ukraine")
                    .font(.subheadline)
                    
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: FeedView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                Text("Contacts")
            } label: {
                Label("Contacts", systemImage: "message")
            }
            NavigationLink {
                Text("Help")
            } label: {
                Label("Help", systemImage: "questionmark.circle")
            }
        }
        .listRowSeparatorTint(.gray)
        .accentColor(.primary)
    }
    
    var links: some View {
        Section {
            Link(destination: URL(string: "http://google.com.ua")!) {
                HStack {
                    Label("Some label", systemImage: "safari")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                        .imageScale(.small)
                }
            }
        }
        .accentColor(.primary)
    }
}

struct AccounView_Previews: PreviewProvider {
    static var previews: some View {
        AccounView()
            .previewDevice("iPhone 13")
        AccounView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
    }
}
