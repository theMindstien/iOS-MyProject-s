//
//  AmazonCollectionViewCell.swift
//  AmazonCollectionView
//
//  Created by apple on 03/10/22.
//

import UIKit

class AmazonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productId: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    var indexPath:IndexPath?
    var viewCon:ViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func actionaddToCart(_ sender: Any) {
        let cart = viewCon!.amazonArray[indexPath!.row]
        let addItemCon:CartViewController = viewCon!.storyboard!.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
             addItemCon.cart = cart
        
        viewCon?.present(addItemCon, animated: true)
    }
}
