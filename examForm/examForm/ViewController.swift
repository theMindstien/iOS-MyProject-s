//
//  ViewController.swift
//  examForm
//
//  Created by apple on 15/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dobfield: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var agefield: UITextField!
    @IBOutlet weak var resultView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.isHidden = true
        datePicker.backgroundColor = UIColor.systemCyan
        // Do any additional setup after loading the view.
    }

    @IBAction func onActioncalenderClick(_ sender: Any) {
        datePicker.isHidden = false
        
    }
    
    @IBAction func onActionSubmit(_ sender: Any) {
        var age:Float = 0
        let dobDate:Date = datePicker.date
        var formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        var strDate = formatter.string(from: dobDate)
         dobfield!.text = "\(strDate)"
        let minDate:Date = datePicker.minimumDate!
       var formatter:DateFormatter = "dd-MM-yyyy"
       // age = datePicker.minimumDate - strDate
        
    }
}

