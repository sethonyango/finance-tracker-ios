import Foundation
import SwiftUI
import Combine

final class AddTransactionViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var amount: String = ""
    @Published var date: Date = Date()
    @Published var isIncome = true
    @Published var category = "Transport"
    @Published var description = ""
    
    func saveTransaction() {
    }
}
