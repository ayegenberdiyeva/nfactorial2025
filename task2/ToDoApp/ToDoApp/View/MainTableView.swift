import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView(ToDoVM: ToDoViewModel())
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView(authVM: AuthViewModel())
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}
