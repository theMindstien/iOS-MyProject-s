//
//  ViewController.swift
//  AmazonCollectionView
//
//  Created by apple on 03/10/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource
{
   
    
    @IBOutlet weak var amazonCollectionView: UICollectionView!
    var amazonArray :[productInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let p1 = productInfo(idNo: "111", name: "Shirt", image: "shirt", price: 900)
        let p2 = productInfo(idNo: "112", name: "Jeans", image: "jeans" , price: 1700 )
        let p3 = productInfo(idNo: "113", name: "Cap", image: "cap", price: 500 )
        let p4 = productInfo(idNo: "114", name: "Belt", image: "belt", price: 300)
        let p5 = productInfo(idNo: "115", name: "Wallet", image: "wallet", price: 400)
        let p6 = productInfo(idNo: "116", name: "Pullover", image: "pullover", price: 2400)
        let p7 = productInfo(idNo: "117", name: "Lower", image: "lower", price: 849)
        amazonArray.append(p1)
        amazonArray.append(p2)
        amazonArray.append(p3)
        amazonArray.append(p4)
        amazonArray.append(p5)
        amazonArray.append(p6)
        amazonArray.append(p7)
        let nib:UINib = UINib(nibName: "AmazonCollectionViewCell", bundle: nil)
        amazonCollectionView.register(nib, forCellWithReuseIdentifier: "product_collection_cell")
        amazonCollectionView.dataSource = self
        
}
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amazonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:AmazonCollectionViewCell = amazonCollectionView.dequeueReusableCell(withReuseIdentifier: "product_collection_cell", for: indexPath) as! AmazonCollectionViewCell
        
        //for data show
        let product = amazonArray[indexPath.row]
        cell.productId.text = product.idNo
        cell.productName.text = product.name
        cell.productPrice.text = "\(product.price)"
        cell.productImage.image = UIImage(named:product.image)
        cell.indexPath = indexPath
        cell.viewCon = self
        
        return cell
    }

}
