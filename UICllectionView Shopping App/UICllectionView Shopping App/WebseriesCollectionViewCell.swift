//
//  WebseriesCollectionViewCell.swift
//  UICllectionView Shopping App
//
//  Created by apple on 04/10/22.
//

import UIKit

class WebseriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var indexPath:IndexPath?
    var viewCon:ViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

}
