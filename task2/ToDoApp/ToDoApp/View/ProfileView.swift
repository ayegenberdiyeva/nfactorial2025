import SwiftUI

struct ProfileView: View {
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                VStack {
                    InfoRow(label: "Username", value: "\(authVM.getUserModel().username)")
                }
                
                Button("Log out") {
                    print("logout tapped")
                    authVM.logOut()
                }
                .foregroundStyle(.red)
            }
            .padding()
        }
    }
}

struct InfoRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack(spacing: 10){
            Text(label)
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundStyle(.primary)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView(authVM: AuthViewModel())
}
