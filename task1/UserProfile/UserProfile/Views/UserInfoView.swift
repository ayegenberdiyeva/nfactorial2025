import SwiftUI

struct UserInfoView: View {
    var name: String
    var age: String
    var location: String
    var followers: String
    
    var body: some View {
        HStack (alignment: .top) {
            Image("pfp")
                .resizable()
                .frame(width: 55, height: 57)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue.opacity(0.3), lineWidth: 2))
                .shadow(radius: 3)
            
            VStack(alignment: .leading) {
                Text(name)
                
                HStack {
                    HStack(){
                        Image(systemName: "calendar")
                        Text(age)
                    }
                    HStack(){
                        Image(systemName: "mappin.and.ellipse")
                        Text(location)
                    }
                    HStack(){
                        Image(systemName: "person.2.fill")
                        Text(followers)
                    }
                    Spacer()
                }
                
            }
            .padding(.leading, 12)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 25)
    }
}
