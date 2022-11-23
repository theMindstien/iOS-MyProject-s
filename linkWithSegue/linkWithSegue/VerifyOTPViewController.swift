//
//  VerifyOTPViewController.swift
//  linkWithSegue
//
//  Created by apple on 29/09/22.
//

import UIKit

class VerifyOTPViewController: UIViewController {
    @IBOutlet weak var mobNoLabel: UILabel!
    @IBOutlet weak var enterOTPTextField: UITextField!
    var mobNo:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobNoLabel!.text = "Mobile-No:\(mobNo)"
        // Do any additional setup after loading the view.
    }
    


}
