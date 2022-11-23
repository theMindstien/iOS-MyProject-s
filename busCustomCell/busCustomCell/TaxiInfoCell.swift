//
//  TaxiInfoCell.swift
//  busCustomCell
//
//  Created by apple on 29/09/22.
//

import UIKit

class TaxiInfoCell: UITableViewCell {
    @IBOutlet weak var taxiNoLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var departLabel: UILabel!
    @IBOutlet weak var reachLabel: UILabel!
    @IBOutlet weak var fareLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    var indexPath:IndexPath?
    var viewCon:ViewController?
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
    @IBAction func actionBook(_ sender: Any) {
        let taxi = viewCon!.taxiInfoArray[indexPath!.row]
        let bookSeatCon:BookSeatViewController = viewCon!.storyboard!.instantiateViewController(withIdentifier: "BookSeatViewController") as! BookSeatViewController
            bookSeatCon.taxi = taxi
        
        viewCon?.present(bookSeatCon, animated: true)
    }
    }
    

