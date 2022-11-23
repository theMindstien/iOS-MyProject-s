//
//  CartViewController.swift
//  AmazonCollectionView
//
//  Created by apple on 03/10/22.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var cartTextView: UITextView!
    var cart:productInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let showData = "[ID No:\(cart!.idNo)],[Name:\(cart!.name)],[Price:\(cart!.price)]"
        cartTextView!.text = showData
        cartImageView!.image = UIImage(named: cart!.image)
    

   
}
    @IBAction func actionConfirm(_ sender: Any) {
        dismiss(animated: true)
    }
}

