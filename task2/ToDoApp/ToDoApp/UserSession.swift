import Foundation

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    
    init() {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func logIn() {
        isLoggedIn = true
    }
    
    func logOut() {
        isLoggedIn = false
    }
    
    func register(username: String, password: String){
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
    }
    
    func validateLogin(username: String, password: String) -> Bool {
        let savedUsername = UserDefaults.standard.string(forKey: "registeredUsername")
        let savedPassword = UserDefaults.standard.string(forKey: "registeredPassword")
        
        return savedUsername == username && savedPassword == password
    }
}
