import Foundation
import Combine

final class ExchangeRatesViewModel: ObservableObject {
    @Published var exchange: Exchange? = nil
    @Published var errorMessage: String?

    func loadData() async {
        do {
            let exchange = try await APIClient.shared.fetchExchangeRates()
            DispatchQueue.main.async {
                self.exchange = exchange
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
}
