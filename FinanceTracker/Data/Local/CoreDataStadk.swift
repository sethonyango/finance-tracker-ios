import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack()
    
    private init() {}
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FinanceAppModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("CoreData load failed: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("CoreData save error: \(error.localizedDescription)")
            }
        }
    }
}
