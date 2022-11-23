//
//  ViewController.swift
//  multiScreenBankAccount
//
//  Created by apple on 15/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var accNoTextView: UITextField!
    @IBOutlet weak var balanceTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionNext(_ sender: Any) {
        let accno:Int = Int(accNoTextView!.text!)!
        let bal:Float = Float(balanceTextView!.text!)!
        let secondScreenCon:SecondViewController = storyboard!.instantiateViewController(withIdentifier: "screen2") as! SecondViewController
            
        secondScreenCon.account = accno
        secondScreenCon.balance = bal
       
        
        secondScreenCon.secondViewcon = self
        
        present(secondScreenCon,animated:true)
    }
    
}

