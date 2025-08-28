import Foundation
import Combine

final class ExchangeRatesViewModel: ObservableObject {
    @Published var exchange: Exchange? = nil
    @Published var errorMessage: String?

    func loadData() async {
        do {
            let exchange = try await APIClient.shared.fetchExchangeRates()
            self.exchange = exchange
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
}
