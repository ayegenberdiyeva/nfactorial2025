import Foundation

@MainActor
class CardViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var isLoading: Bool = false
    @Published var errorDescription: String?
    
    private let episodeService = EpisodeService()
    
    func fetchEpisodeNames(for character: CharacterResponse.Character) async {
        isLoading = true
        do {
            self.episodes = try await episodeService.getEpisodes(by: character.episode)
        } catch {
            errorDescription = error.localizedDescription
        }
        isLoading = false
    }
}
