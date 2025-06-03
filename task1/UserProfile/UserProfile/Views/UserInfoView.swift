import SwiftUI

struct UserInfoView: View {
    var name: String
    var age: String
    var location: String
    var followers: String
    
    var body: some View {
        HStack (alignment: .top) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 52, height: 52)
            
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
    }
}
