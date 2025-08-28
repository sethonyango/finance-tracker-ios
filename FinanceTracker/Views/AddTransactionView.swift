import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = AddTransactionViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                }
                Text("Add Transaction")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Category Toggle
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Category")
                            .font(.system(size: 14, weight: .medium))
                        
                        HStack(spacing: 12) {
                            Button {
                                viewModel.isIncome = true
                            } label: {
                                HStack {
                                    Circle()
                                        .fill(viewModel.isIncome ? Color.green : Color.gray.opacity(0.3))
                                        .frame(width: 16, height: 16)
                                    Text("Income")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                viewModel.isIncome = false
                            } label: {
                                HStack {
                                    Circle()
                                        .fill(!viewModel.isIncome ? Color.green : Color.gray.opacity(0.3))
                                        .frame(width: 16, height: 16)
                                    Text("Expense")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Amount (KES)")
                            .font(.system(size: 14, weight: .medium))
                        
                        TextField("1000.00", text: $viewModel.amount)
                            .font(.system(size: 16))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .keyboardType(.decimalPad)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date")
                            .font(.system(size: 14, weight: .medium))
                        
                        HStack {
                            Text("28/07/2025")
                                .font(.system(size: 16))
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "calendar")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                    
                    
                    // Category Dropdown
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Category")
                            .font(.system(size: 14, weight: .medium))
                        
                        HStack {
                            Image(systemName: "car")
                                .foregroundColor(.red)
                            Text("Transport")
                                .font(.system(size: 16))
                            Spacer()
                            Image(systemName: "chevron.down")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.system(size: 14, weight: .medium))
                        
                        TextField("Fuel for wife's car", text: $viewModel.description)
                            .font(.system(size: 16))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                    
                    Spacer(minLength: 40)
                    
                    Button(action: {}) {
                        Text("Add Transaction")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                
            }
            
            Spacer()
        }
        .background(Color.white)
        .navigationBarHidden(true)
    }
}
