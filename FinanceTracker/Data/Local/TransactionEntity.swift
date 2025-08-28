import CoreData
import Foundation

@objc(TransactionEntity)
public class TransactionEntity: NSManagedObject {
    @NSManaged public var id: String
    @NSManaged public var amount: Double
    @NSManaged public var date: Date
    @NSManaged public var currency: String
}
