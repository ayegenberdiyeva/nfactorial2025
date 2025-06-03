import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationStack {
            VStack {
                UserInfoView(name: "Amina", age: "20", location: "Kazakhstan", followers: "10")
                
                NavigationLink(destination: DetailsView()) {
                    CustomButton(title: "Details")
                                    .padding()
                }
                
                
                Divider()
                    .padding(.horizontal, 20)
                
                HStack {
                    PPostView(posts: [
                        Post(title: "First Post", content: "This is test post."),
                        Post(title: "Second Post", content: "Another post here."),
                    ])
                }
                
                Spacer()
            }
        }
    }
}





#Preview {
    ContentView()
}
