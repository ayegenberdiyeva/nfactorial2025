import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var UserModel: UserModel
    @Published var isLoggedIn: Bool = false
    @Published var loginError: String?
    @Published var registerError: String?
    @Published var showAlert = false
    
    private let usernameKey = "registeredUsername"
    private let passwordKey = "registeredPassword"
    private let loginStateKey = "isLoggedIn"
    
    init() {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: loginStateKey)
        self.UserModel = .init(username: "", password: "")
    }
    
    func register(username: String, password: String) {
        guard !username.isEmpty, !password.isEmpty else {
            registerError = "Username and password must not be empty."
            return
        }
        
        self.UserModel = ToDoApp.UserModel(username: username, password: password)
        
        UserDefaults.standard.set(username, forKey: usernameKey)
        UserDefaults.standard.set(password, forKey: passwordKey)
        UserDefaults.standard.set(true, forKey: loginStateKey)
        
        isLoggedIn = true
        registerError = nil
    }
    
    func logIn(username: String, password: String) -> Bool {
        showAlert = false
        let savedUsername = UserDefaults.standard.string(forKey: usernameKey)
        let savedPassword = UserDefaults.standard.string(forKey: passwordKey)
        
        if username == savedUsername && password == savedPassword {
            UserDefaults.standard.set(true, forKey: loginStateKey)
            isLoggedIn = true
            loginError = nil
        } else {
            loginError = "Invalid username or password."
            showAlert = true
        }
        return showAlert
    }
    
    func logOut() {
        UserDefaults.standard.set(false, forKey: loginStateKey)
        isLoggedIn = false
    }
    
    func getUserModel() -> UserModel {
        return self.UserModel
    }
}
