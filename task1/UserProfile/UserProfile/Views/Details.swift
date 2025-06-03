import SwiftUI

struct DetailsView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                        Image("pfp")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue.opacity(0.3), lineWidth: 2))
                            .shadow(radius: 3)
                        
                        VStack(spacing: 15){
                            InfoRow(label: "Name", value: "Amina")
                            InfoRow(label: "Age", value: "20")
                            InfoRow(label: "Location", value: "Kazakhstan, Almaty")
                            InfoRow(label: "Email", value: "12345@gmail.com")
                            InfoRow(label: "Phone", value: "12345")
                        }
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                        .shadow(color: Color.blue, radius: 5)
                        .padding()
                    }
                    
                    NavigationLink(destination: ContentView()) {
                        CustomButton(title: "Profile")
                                        .padding()
                    }
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
    DetailsView()
}
