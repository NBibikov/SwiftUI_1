
import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            List {
                Label("Youtube", systemImage: "house")
                Label("Courses", systemImage: "square.grid.2x2")
                Label("Some TV", systemImage: "tv")
            }
            .listStyle(.sidebar)
            .navigationTitle("Some title")
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
