import SwiftUI

@main
struct ToDoAppApp: App {
    @StateObject var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
           if authVM.isLoggedIn {
                MainTabView()
                   .environmentObject(authVM)
           } else {
               LoginView()
                   .environmentObject(authVM)
           }
        }
    }
}

