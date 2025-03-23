import UIKit
import CoreData

class AddProductViewController: UIViewController {

    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productDescriptionTextField: UITextField!
    @IBOutlet weak var productPriceTextField: UITextField!
    @IBOutlet weak var productProviderTextField: UITextField!
    
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    @IBAction func saveProduct(_ sender: UIButton) {
        let newProduct = Product(context: context)
        newProduct.productName = productNameTextField.text
        newProduct.productDescription = productDescriptionTextField.text
        newProduct.productPrice = Double(productPriceTextField.text ?? "0.0") ?? 0.0
        newProduct.productProvider = productProviderTextField.text
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print("Failed to save product: \(error)")
        }
    }
}

