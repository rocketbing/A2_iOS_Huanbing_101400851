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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.productName
        cell.detailTextLabel?.text = product.productDescription
        return cell
    }
    
    // Navigation to Detail View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail" {
            let productDetailVC = segue.destination as! ProductDetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                productDetailVC.product = products[indexPath.row]
            }
        }
    }
    
    // Search functionality
    @IBAction func searchProducts(_ sender: UISearchBar) {
        let searchTerm = sender.text ?? ""
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "productName CONTAINS[cd] %@ OR productDescription CONTAINS[cd] %@", searchTerm, searchTerm)
        
        do {
            products = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch {
            print("Failed to search products: \(error)")
        }
    }
}

