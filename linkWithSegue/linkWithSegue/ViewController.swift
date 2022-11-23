//
//  ViewController.swift
//  linkWithSegue
//
//  Created by apple on 29/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mobTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  // for next screen
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(identifier == "id_otp_segue" && mobTextField!.text!.count == 10){
            return true
            
        }
        if(identifier == "id_about_segue"){
            return true
        }
        return false
    }
    
    // to pass data to next controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "id_otp_segue"){
            let verifyCon:VerifyOTPViewController = segue.destination as! VerifyOTPViewController
            verifyCon.mobNo = mobTextField!.text!
        }
    }
    
}

