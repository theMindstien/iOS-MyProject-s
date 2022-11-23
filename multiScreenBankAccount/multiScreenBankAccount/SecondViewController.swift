//
//  SecondViewController.swift
//  multiScreenBankAccount
//
//  Created by apple on 15/09/22.
//

import UIKit

class SecondViewController: UIViewController {
    var secondViewcon:ViewController?
    
    @IBOutlet weak var accNoLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    var account:Int = 0
    var balance:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accNoLabel!.text = "Account No:\(account)"
        balanceLabel!.text = "Balance:\(balance)"
}
    
    @IBAction func actionDeposite(_ sender: Any) {
        
        var amt:Float = Float(amountTextField!.text!)!
        amt = balance + amt
        balanceLabel!.text! = "Balance:\(amt)" // show in balancelabelview
        
        secondViewcon!.balanceTextView!.text = String(amt)
        
    }
    
    @IBAction func actionwithdraw(_ sender: Any) {
        var amt:Float = Float(amountTextField!.text!)!
         amt = balance - amt
         balanceLabel!.text! = "Balance:\(amt)" // show in balancelabelview
        
        secondViewcon!.balanceTextView!.text = String(amt)
        
        
        
    }
    
    @IBAction func actionBack(_ sender: Any) {
       
       dismiss(animated:true)
        
        
    }
}
