import UIKit
import CoreData

class AddProductView: UIViewController {

    // Outlets for text fields where users input product details
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productDescriptionTextField: UITextField!
    @IBOutlet weak var productPriceTextField: UITextField!
    @IBOutlet weak var productProviderTextField: UITextField!
    
    // Reference to the Core Data context
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    // Action when the user taps "Save"
    @IBAction func saveProduct(_ sender: UIButton) {
        // Ensure all fields are filled
        guard let name = productNameTextField.text, !name.isEmpty,
              let description = productDescriptionTextField.text, !description.isEmpty,
              let priceString = productPriceTextField.text, let price = Double(priceString),
              let provider = productProviderTextField.text, !provider.isEmpty else {
            // Alert the user if any field is empty
            showAlert(message: "Please fill in all fields.")
            return
        }
        
        // Create a new product and populate it with the data from text fields
        let newProduct = Product(context: context)
        newProduct.productName = name
        newProduct.productDescription = description
        newProduct.productPrice = price
        newProduct.productProvider = provider
        
        do {
            // Save the new product to Core Data
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            // Handle errors
            print("Failed to save product: \(error)")
        }
    }
    
    // Helper method to show an alert if something goes wrong
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

