import SwiftUI

struct TransactionView: View {
    @StateObject private var viewModel = TransactionsViewModel()

    @State private var navigate = false

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 32, height: 32)
                    Text("Good Morning Tony")
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                
                let summary = viewModel.transactions.summary()
                
                // Balance Card
                VStack(alignment: .center, spacing: 16) {
                    Text("Current Balance")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.8))
                    
                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text(summary.currentBalance, format: .number.precision(.fractionLength(2)))
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("KES")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    HStack(spacing: 32) {
                        VStack(alignment: .center, spacing: 4) {
                            Text("Money In")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.8))
                            Text("\(summary.currency) \(summary.moneyIn, specifier: "%.2f")")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                        }
                        
                        Divider()
                            .frame(height: 32)
                            .background(Color.white.opacity(0.6))
                        
                        VStack(alignment: .center, spacing: 4) {
                            Text("Money Out")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.8))
                            Text("\(summary.currency) \(summary.moneyOut, specifier: "%.2f")")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 24)
                .background(
                    LinearGradient(
                        colors: [Color(red: 0.2, green: 0.8, blue: 0.2),
                                 Color(red: 0.1, green: 0.4, blue: 0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(16)
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .frame(maxWidth: .infinity)
                

                VStack(spacing: 0) {
                    // Recent Transactions Header
                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text("Recent Five Transactions")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Button("View All") {}
                            .font(.system(size: 14))
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .padding(.bottom, 12)
                    
                    Divider()
                    if viewModel.transactions.isEmpty {
                         VStack(spacing: 8) {
                             Image(systemName: "tray")
                                 .font(.system(size: 36))
                                 .foregroundColor(.gray.opacity(0.5))
                             Text("No transactions yet")
                                 .font(.subheadline)
                                 .foregroundColor(.gray)
                         }
                         .frame(maxWidth: .infinity, minHeight: 120)
                         .padding()
                    } else {
                        // Top 5 Transactions
                        VStack(alignment: .center, spacing: 16) {
                            ForEach(viewModel.transactions.prefix(5)) { tx in
                                TransactionRow(transaction: tx)
                                
                                if tx.id != viewModel.transactions.prefix(5).last?.id {
                                    Divider()
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    Divider()
                    
                    // Add a Transaction
                    Button(action: { self.navigate = true }) {
                        Text("Add Transaction")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(16)
                    
                }
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                .padding(.horizontal, 24)
                .padding(.top, 24)
                
                Spacer()

            }
            .task {
               // await viewModel.loadData()
            }
            
            // Hidden navigation trigger
            NavigationLink("", destination: AddTransactionView(), isActive: $navigate)
                .hidden()
        }
    }
}


// MARK: - Transaction Row Component
struct TransactionRow: View {
    let transaction: Transaction
    
    var amountColor: Color {
        transaction.type.lowercased() == "withdrawal" ? .red : .green
    }
    
    
    var body: some View {
        HStack(spacing: 12) {
            // Icon circle
            ZStack {
                 Circle()
                     .fill(Color.gray.opacity(0.1))
                     .frame(width: 40, height: 40)
                 Text(String(transaction.account.prefix(1)).uppercased())
                     .font(.system(size: 16))
           }
            
            VStack(alignment: .leading, spacing: 2) {
               Text(transaction.description)
                   .font(.system(size: 14, weight: .medium))
               Text(transaction.date.formatted(date: .abbreviated, time: .omitted))
                   .font(.system(size: 12))
                   .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(transaction.formattedAmount())
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(amountColor)
        }
        .padding(.vertical, 12)
    }
}
