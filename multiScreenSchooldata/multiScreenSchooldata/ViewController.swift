//
//  ViewController.swift
//  multiScreenSchooldata
//
//  Created by apple on 15/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var classField: UITextField!
    @IBOutlet weak var feeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onActionNext(_ sender: Any) {
        let n:String = (nameField!.text!)
        let c:Int = Int(classField!.text!)!
        let r:Float = Float(feeField!.text!)!
        
        let secondScreenCon:SecondViewController =
        storyboard!.instantiateViewController(withIdentifier: "screen2")as!SecondViewController
        secondScreenCon.name = n
        secondScreenCon.clas = c
        secondScreenCon.remFee = r
        
        secondScreenCon.secondViewCon = self
    
        
        present(secondScreenCon,animated: true)
    }
    
}

