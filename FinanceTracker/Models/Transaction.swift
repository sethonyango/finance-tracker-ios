import Foundation

protocol TransactionRepresentable {
    var id: String { get }
    var amount: Double { get }
    var currency: String { get }
    var date: Date { get }
}

extension TransactionRepresentable {
    func formattedAmount(locale: Locale = .current) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        formatter.locale = locale
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount) \(currency)"
    }

    func formattedDate(style: DateFormatter.Style = .medium) -> String {
        let df = DateFormatter()
        df.dateStyle = style
        df.timeStyle = .short
        return df.string(from: date)
    }
}


struct Transaction: TransactionRepresentable, Identifiable, Codable {
    var amount: Double
    var id: String
    var date: Date
    var description: String
    var currency: String
    var type: String
    var account: String
    var balance: Float
    var status: String
}

struct TransactionSummary {
    let currentBalance: Double
    let moneyIn: Double
    let moneyOut: Double
    let currency: String
}

extension Array where Element == Transaction {
    func summary() -> TransactionSummary {
        let moneyIn = self.filter { $0.type.lowercased() == "in" }.map(\.amount).reduce(0, +)
        let moneyOut = self.filter { $0.type.lowercased() == "out" }.map(\.amount).reduce(0, +)
        let currentBalance = self.last?.balance ?? 0
        let currency = self.last?.currency ?? "KES"
        
        return TransactionSummary(
            currentBalance: Double(currentBalance),
            moneyIn: moneyIn,
            moneyOut: moneyOut,
            currency: currency
        )
    }
}
