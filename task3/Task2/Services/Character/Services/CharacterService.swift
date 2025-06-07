import Foundation

class CharacterService {
    private let networkClient = NetworkClient()
    
    func get() async throws -> CharacterResponse {
        try await networkClient.get(relativePath: "/api/character")
    }
}
