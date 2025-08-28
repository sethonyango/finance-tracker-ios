import SwiftUI

struct ExchangesView: View {
    @StateObject private var viewModel = ExchangeRatesViewModel()
    
    var body: some View {
        Group {
            if let exchange = viewModel.exchange {
                List(exchange.rates) { rate in
                    HStack {
                        Text(rate.name)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(rate.currency)
                                .font(.headline)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Buy")
                                        .foregroundColor(.green)
                                    Text("\(rate.buy_rate, specifier: "%.2f")")
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Sell")
                                        .foregroundColor(.red)
                                    Text("\(rate.sell_rate, specifier: "%.2f")")
                                }
                            }
                            .font(.subheadline)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 4)
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Exchange Rates")
        .task {
           await viewModel.loadData()
        }
    }
}
