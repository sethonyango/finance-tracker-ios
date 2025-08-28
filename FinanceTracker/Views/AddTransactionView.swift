import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = AddTransactionViewModel()
        
    var body: some View {
           VStack(alignment: .leading, spacing: 16) {
               Text("Add Transaction")
                   .font(.title3)
                   .bold()
                   .padding(.top)
               
               // Category Toggle
               HStack {
                   Button {
                       viewModel.isIncome = true
                   } label: {
                       Label("Income", systemImage: "arrow.down.circle")
                           .padding()
                           .frame(maxWidth: .infinity)
                           .background(viewModel.isIncome ? Color.green.opacity(0.2) : Color.gray.opacity(0.1))
                           .cornerRadius(8)
                   }
                   
                   Button {
                       viewModel.isIncome = false
                   } label: {
                       Label("Expense", systemImage: "arrow.up.circle")
                           .padding()
                           .frame(maxWidth: .infinity)
                           .background(!viewModel.isIncome ? Color.red.opacity(0.2) : Color.gray.opacity(0.1))
                           .cornerRadius(8)
                   }
               }
               
               TextField("Amount (KES)", text: $viewModel.amount)
                   .keyboardType(.decimalPad)
                   .padding()
                   .background(Color.gray.opacity(0.1))
                   .cornerRadius(8)
               
               DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                   .padding()
                   .background(Color.gray.opacity(0.1))
                   .cornerRadius(8)
               
               Picker("Category", selection: $viewModel.category) {
                   Text("Transport").tag("Transport")
                   Text("Food").tag("Food")
                   Text("Shopping").tag("Shopping")
               }
               .pickerStyle(MenuPickerStyle())
               .padding()
               .background(Color.gray.opacity(0.1))
               .cornerRadius(8)
               
               TextField("Description", text: $viewModel.description)
                   .padding()
                   .background(Color.gray.opacity(0.1))
                   .cornerRadius(8)
               
               Spacer()
               
               Button(action: {}) {
                   Text("Add Transaction")
                       .fontWeight(.bold)
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(Color.green)
                       .foregroundColor(.white)
                       .cornerRadius(10)
               }
           }
           .padding()
       }
}
