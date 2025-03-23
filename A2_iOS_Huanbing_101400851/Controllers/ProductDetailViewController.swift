import UIKit

class ProductDetailViewController: UIViewController {

    var product: Product?
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productProviderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let product = product {
            productNameLabel.text = product.productName
            productDescriptionLabel.text = product.productDescription
            productPriceLabel.text = "$\(product.productPrice)"
            productProviderLabel.text = product.productProvider
        }
    }
}

