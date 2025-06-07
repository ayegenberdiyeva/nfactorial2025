import Foundation

class EpisodeService {
    private let networkClient = NetworkClient()
    
    func getEpisodes(by urls: [String]) async throws -> [Episode] {
        var episodes: [Episode] = []
        for url in urls {
            guard let path = URL(string: url)?.path else { continue }
            let episode: Episode = try await networkClient.get(relativePath: path)
            episodes.append(episode)
        }
        return episodes
    }
}
