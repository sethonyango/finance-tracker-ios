import CoreData

protocol TransactionRepositoryProtocol {
    func addTransaction(title: String, amount: Double, date: Date)
    func fetchTransactions() -> [TransactionEntity]
}

final class TransactionRepository: TransactionRepositoryProtocol {
    private let context = CoreDataStack.shared.context
    
    func addTransaction(title: String, amount: Double, date: Date) {
        let transaction = TransactionEntity(context: context)
        transaction.id = UUID().uuidString
        transaction.amount = amount
        transaction.date = date
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchTransactions() -> [TransactionEntity] {
        let request: NSFetchRequest<TransactionEntity> = TransactionEntity.fetchRequest() as! NSFetchRequest<TransactionEntity>
        do {
            return try context.fetch(request)
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }
}

