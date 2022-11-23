//
//  SecondViewController.swift
//  multiScreenSchooldata
//
//  Created by apple on 15/09/22.
//

import UIKit

class SecondViewController: UIViewController {
    var secondViewCon:ViewController?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var remainingAmountLabel: UILabel!
    @IBOutlet weak var amountTextfield: UITextField!
    var name:String = ""
    var clas:Int = 0
    var remFee:Float = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel!.text = "Name:\(name)"
        classLabel!.text = "Class:\(clas)"
        remainingAmountLabel!.text = "Remaining Fees:\(remFee)"
       // print(remFee)
    
       }
    

    @IBAction func onActionDeposite(_ sender: Any) {
        
        var amt:Float = Float(amountTextfield!.text!)!
       // print(amt)
        
        
        amt = remFee - amt
        //print(amt)
//        secondViewCon!.feeField!.text = String(amt)
        remainingAmountLabel!.text! = "Remaining fee:\(amt)"
        secondViewCon!.feeField!.text = "Remaining fee:\(amt)"
        
    }
    
    @IBAction func onActionBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
