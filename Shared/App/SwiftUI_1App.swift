//
//  SwiftUI_1App.swift
//  Shared
//
//  Created by Mykola Bibikov on 06.03.2022.
//

import SwiftUI

@main
struct SwiftUI_1App: App {
    
    @StateObject var model = NavigationModel() // Avoid calling multiple times, ensures that model initilize once and follows the lifecycle of the app
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
