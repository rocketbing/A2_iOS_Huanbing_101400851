import UIKit
import CoreData

class ProductListViewController: UITableViewController {
    
    var products = [Product]()
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        loadProducts()
    }
    
    func loadProducts() {
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        do {
            products = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch {
            print("Failed to fetch products: \(error)")
        }
    }
    
}
