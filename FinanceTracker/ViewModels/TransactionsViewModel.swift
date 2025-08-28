import Foundation
import Combine

final class TransactionsViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var errorMessage: String?

    func loadData() async {
        do {
            let txs = try await APIClient.shared.fetchTransactions()
            DispatchQueue.main.async {
                self.transactions = txs
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
