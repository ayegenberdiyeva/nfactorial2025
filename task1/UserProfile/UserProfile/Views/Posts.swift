import SwiftUI

struct Post: Identifiable {
    var id: UUID = UUID()
    var title: String
    var content: String
}

struct PPostView: View {
    var posts: [Post] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Posts")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            ForEach(posts) { post in
                VStack(alignment: .leading, spacing: 8){
                    Text(post.title)
                        .font(.headline)
                    Text(post.content)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Divider()
                }
                .padding(.horizontal)
            }
        }
    }
}
