//
//  ViewController.swift
//  multiScreenDataBackToFirstScreen
//
//  Created by apple on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var dobField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionToSelectFromCalender(_ sender: Any) {
        
        let secondScreenCon:secondViewController =
        storyboard!.instantiateViewController(withIdentifier: "screen2") as!secondViewController
           //-------------------------    ------------
           secondScreenCon.dobViewCon = self
        //---------------------
        present(secondScreenCon,animated: true)
    }
    
}

