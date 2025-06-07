import SwiftUI

struct CardView: View {
    let character: CharacterResponse.Character
    @StateObject var ViewModel = CardViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: character.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .frame(width: 150, height: 150)
                } else {
                    ProgressView()
                }
            }

            Text(character.name)
                .font(.title)
                .fontWeight(.bold)

            Text("\(character.status) • \(character.species)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Gender:")
                        .bold()
                    Text(character.gender)
                }

                if !character.type.isEmpty {
                    HStack {
                        Text("Type:")
                            .bold()
                        Text(character.type)
                    }
                }

                HStack {
                    Text("Origin:")
                        .bold()
                    Text(character.origin.name)
                }

                HStack {
                    Text("Location:")
                        .bold()
                    Text(character.location.name)
                }
                
                HStack(alignment: .top) {
                    Text("Episodes:")
                        .bold()
                    
                    VStack(alignment: .leading) {
                        if ViewModel.isLoading {
                                ProgressView()
                                Text("Loading...")
                        } else if let errorDescription = ViewModel.errorDescription {
                            Text(errorDescription)
                        } else {
                            if $ViewModel.episodes.isEmpty {
                                Text("No episodes.")
                            } else {
                                List (ViewModel.episodes) { episode in
                                    Text(episode.name)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .task {
            Task {
                await ViewModel.fetchEpisodeNames(for: character)
            }
        }
        .padding()
    }
}
