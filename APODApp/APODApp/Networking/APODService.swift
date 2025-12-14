import Foundation

final class APODService {
    private let apiKey = "DEMO_KEY"
    private let baseURL = "https://api.nasa.gov/planetary/apod"

    func fetchAPOD(for date: String? = nil) async throws -> APOD {
        var urlComponents = URLComponents(string: baseURL)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "hd", value: "true")
        ]
        
        if let date = date {
            urlComponents.queryItems?.append(URLQueryItem(name: "date", value: date))
        }
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(APOD.self, from: data)
    }
}

