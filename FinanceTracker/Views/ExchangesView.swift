import SwiftUI

struct ExchangesView: View {
    @StateObject private var viewModel = ExchangeRatesViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                }
                Text("Exchange Rate")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            
            Spacer()
            
            if let exchange = viewModel.exchange {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    ExchangeRateCard(
                        flag: "🇺🇸",
                        code: "USD",
                        name: "United States Dollar",
                        buyRate: 144.25,
                        sellRate: 145.35
                    )
                    
                    // GBP
                    ExchangeRateCard(
                        flag: "🇬🇧",
                        code: "GBP",
                        name: "Great Britain Pound",
                        buyRate: 183.80,
                        sellRate: 185.23
                    )
                    
                    // EUR
                    ExchangeRateCard(
                        flag: "🇪🇺",
                        code: "EUR",
                        name: "Euro",
                        buyRate: 156.97,
                        sellRate: 158.71
                    )
                    
                    // CNY
                    ExchangeRateCard(
                        flag: "🇨🇳",
                        code: "CNY",
                        name: "China Yuan",
                        buyRate: 19.81,
                        sellRate: 19.96
                    )
                    
                    // UGX
                    ExchangeRateCard(
                        flag: "🇺🇬",
                        code: "UGX",
                        name: "Uganda Shilling",
                        buyRate: 25.61,
                        sellRate: 25.86
                    )
                    
                    // TZS
                    ExchangeRateCard(
                        flag: "🇹🇿",
                        code: "TZS",
                        name: "Tanzania Shilling",
                        buyRate: 17.12,
                        sellRate: 17.30
                    )
                    
                    // RWF
                    ExchangeRateCard(
                        flag: "🇷🇼",
                        code: "RWF",
                        name: "Rwanda Franc",
                        buyRate: 7.96,
                        sellRate: 8.21
                    )
                    
                    // ZAR
                    ExchangeRateCard(
                        flag: "🇿🇦",
                        code: "ZAR",
                        name: "South Africa Rand",
                        buyRate: 7.40,
                        sellRate: 7.65
                    )
                }
            } else {
                VStack(spacing: 8) {
                    Image(systemName: "tray")
                        .font(.system(size: 36))
                        .foregroundColor(.gray.opacity(0.5))
                    Text("No exchange rates yet")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, minHeight: 120)
                .padding()
            }
            
            Spacer()
        }
        .background(Color.white)
        .navigationBarHidden(true)
        .task {
            await viewModel.loadData()
        }
    }
}


// MARK: - Exchange Rate Card Component
struct ExchangeRateCard: View {
    let flag: String
    let code: String
    let name: String
    let buyRate: Double
    let sellRate: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(flag)
                    .font(.system(size: 24))
                VStack(alignment: .leading, spacing: 2) {
                    Text(code)
                        .font(.system(size: 16, weight: .semibold))
                    Text(name)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Buy")
                        .font(.system(size: 12))
                        .foregroundColor(.green)
                    Text(String(format: "%.2f", buyRate))
                        .font(.system(size: 14, weight: .medium))
                }
                Spacer()
                VStack(alignment: .leading, spacing: 4) {
                    Text("Sell")
                        .font(.system(size: 12))
                        .foregroundColor(.red)
                    Text(String(format: "%.2f", sellRate))
                        .font(.system(size: 14, weight: .medium))
                }
            }
        }
        .padding(16)
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}
