//
//  secondViewController.swift
//  multiScreenDataBackToFirstScreen
//
//  Created by apple on 14/09/22.
//

import UIKit

class secondViewController: UIViewController {

   
    @IBOutlet weak var dobPicker: UIDatePicker!
    var dobViewCon:ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dobPicker.backgroundColor = UIColor.systemBrown
       
    }
    

    @IBAction func actionToSendDOBToFirstScreen(_ sender: Any) {
        
        let dobdate:Date = dobPicker.date
  let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyy"
        
        let strdate = formatter.string(from: dobdate)
        
        //------------- ----------------
        dobViewCon!.dobField!.text = strdate
        
        
        dismiss(animated: true)
    }
    

}
