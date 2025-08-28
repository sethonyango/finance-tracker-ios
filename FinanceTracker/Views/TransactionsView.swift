import SwiftUI

struct TransactionView: View {
    @StateObject private var viewModel = TransactionsViewModel()
    @State private var balance: Double = 152500
    @State private var navigate = false

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 16) {
                // Greeting
                Text("Good Morning Tony")
                    .font(.headline)
                    .padding(.horizontal, 32)
                
                // Balance Card
                VStack {
                    Text("Current Balance")
                        .foregroundColor(.white.opacity(0.7))
                    Text(balance.formatted(.currency(code: "KES")))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack {
                        VStack {
                            Text("Money In")
                                .foregroundColor(.white.opacity(0.7))
                            Text("KES 130,000.00")
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack {
                            Text("Money Out")
                                .foregroundColor(.white.opacity(0.7))
                            Text("KES 12,000.00")
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [.green, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Recent Transactions
                HStack {
                    Text("Recent Five Transactions")
                        .font(.headline)
                    Spacer()
                    Button("View All") {}
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                .padding(.horizontal)
                List(viewModel.transactions.prefix(5)) { tx in
                    HStack {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 40, height: 40)
                            .overlay(Image(systemName: "cart"))
                        
                        VStack(alignment: .leading) {
                            Text(tx.description)
                                .font(.subheadline)
                            Text(tx.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("Ksh. \(tx.amount, specifier: "%.2f")")
                            .foregroundColor(.red)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(PlainListStyle())
                
                Button(action: {self.navigate = true}) {
                    Text("Add Transaction")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .tabViewStyle(PageTabViewStyle())
            .task {
                await viewModel.loadData()
            }
            
            
            // Hidden navigation trigger
            NavigationLink("", destination: AddTransactionView(), isActive: $navigate)
                .hidden()
        }
    }
}
