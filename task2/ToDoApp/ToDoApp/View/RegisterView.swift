import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var authVM: AuthViewModel
    @State private var username = ""
    @State private var password = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Register")
                    .font(.title)
                
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Register") {
                    guard !username.isEmpty, !password.isEmpty else {
                        showAlert = true
                        return
                    }
                    authVM.register(username: username, password: password)
                    showAlert = authVM.logIn(username: username, password: password)
                }
                
                Spacer()
                
                Button("Cancel") {
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            }
            .padding()
            .alert("Username or password cannot be empty!",isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}

#Preview {
    RegisterView()
}
