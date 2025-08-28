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
