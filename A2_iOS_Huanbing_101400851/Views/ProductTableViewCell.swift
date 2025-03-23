import UIKit

class ProductTableViewCell: UITableViewCell {
    
    // UI elements for product name and description
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    // Configure the cell with product information
    func configureCell(with product: Product) {
        productNameLabel.text = product.productName
        productDescriptionLabel.text = product.productDescription
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Custom setup for the cell if needed
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

