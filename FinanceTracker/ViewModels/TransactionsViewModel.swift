import Foundation
import Combine

final class TransactionsViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var errorMessage: String?

    func loadData() async {
        do {
            let txs = try await APIClient.shared.fetchTransactions()
            self.transactions = txs
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
