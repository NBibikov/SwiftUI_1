
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: NavigationModel
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showAccount") var showAccount = false
    
    init() {
        showAccount = false
    }
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .home:
                    FeedView()
                case .explore:
                    Text("tab 2")
                case .notifications:
                    Text("tab 3")
//                    NotificationsView()
                case .library:
                    Text("tab 4")
//                    LibraryView()
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {}.frame(height: 44)
            }
            
            TabBar()
            
            if model.showModal {
                ModalView()
                    .accessibilityIdentifier("Identifier")
            }
        }
        
        .dynamicTypeSize(.large ... .xxLarge)
        .sheet(isPresented: $showAccount) {
            Text("pravda")
//            AccountView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NavigationModel())
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
    }
}
