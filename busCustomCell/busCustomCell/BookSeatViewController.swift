//
//  BookSeatViewController.swift
//  busCustomCell
//
//  Created by apple on 29/09/22.
//

import UIKit

class BookSeatViewController: UIViewController {
    @IBOutlet weak var seatBookingTextView: UITextView!
    @IBOutlet weak var confirmImage: UIImageView!
    var taxi:TaxiInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        let showData = "Taxi No:[\(taxi!.taxiNo)],From:[\(taxi!.source)],To:[\(taxi!.destination)],depart Time:[\(taxi!.departTime)],Reach By:[\(taxi!.reachTime)],Fare - [Rs:\(taxi!.fare)]"
          seatBookingTextView!.text = showData
        confirmImage!.image = UIImage(named: "\(taxi!.taxiPhoto)")
    }
    
    @IBAction func actionConfirm(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
  

}
