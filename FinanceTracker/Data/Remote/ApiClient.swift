import Foundation

final class APIClient {
    static let shared = APIClient()
    private init() {}
    
    private let baseURL = "https://ftracker.free.beeceptor.com/"
    
    private func fetchData<T: Decodable>(endpoint: String, type: T.Type) async throws -> T {
        guard let url = URL(string: baseURL + endpoint) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
    
    // MARK: - Transactions
    func fetchTransactions() async throws -> [Transaction] {
        try await fetchData(endpoint: "transactions", type: [Transaction].self)
    }
    
    // MARK: - Exchange Rates
    func fetchExchangeRates() async throws -> Exchange {
        try await fetchData(endpoint: "exchangeRtes", type: Exchange.self)
    }
}
