import Foundation

class NetworkClient {
    private let baseURL = "https://rickandmortyapi.com"
    
    func get<Response: Decodable> (
        relativePath: String
    ) async throws -> Response {
        guard
            let URL = URL(string: baseURL + relativePath)
        else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        let(data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(Response.self, from: data)
        
        return response
    }
}
