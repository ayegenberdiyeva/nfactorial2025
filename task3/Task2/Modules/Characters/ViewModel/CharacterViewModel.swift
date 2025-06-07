import Foundation

class CharacterViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var characters: [CharacterResponse.Character] = []
    @Published var errorDescription: String?
    
    private let characterService = CharacterService()
    
    @MainActor
    func fetchCharacters() async {
        isLoading = true
        do {
            characters = try await characterService.get().results
//            let result = try await characterService.get()
//            DispatchQueue.main.async {
//                self.characters = result
//            }
        } catch {
            errorDescription = error.localizedDescription
        }
        isLoading = false
    }
}
