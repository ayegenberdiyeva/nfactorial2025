import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [CharacterResponse.Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}


extension CharacterResponse {
    struct Character: Codable, Identifiable {
        let id: Int
        let name: String
        let status: String
        let species: String
        let type: String
        let gender: String
        let image: String
        let origin: CharacterResponse.Character.Origin
        let location: CharacterResponse.Character.Location
        let episode: [String]
        
        struct Origin: Codable {
        let name: String
        let url: String
        }
        
        struct Location: Codable {
            let name: String
            let url: String
        }
    }
}

