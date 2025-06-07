import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var username = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var showRegister = false
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login") {
                showAlert = authVM.logIn(username: username, password: password)
            }
            .padding()
            
            Button("Don't have an account? Sign up!") {
                showRegister = true
            }
            .font(.footnote)
        }
        .padding()
        .alert("Wrong Credentials", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Please try again.")
        }
        .sheet(isPresented: $showRegister) {
            RegisterView()
                .environmentObject(authVM)
        }
    }
}

#Preview {
    LoginView()
}
