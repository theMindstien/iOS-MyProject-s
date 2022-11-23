//
//  ViewController.swift
//  datepicker
//
//  Created by apple on 12/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nametextfield: UITextField!
    @IBOutlet weak var gendersegment: UISegmentedControl!
    @IBOutlet weak var salarylabel: UILabel!
    @IBOutlet weak var dobpicker: UIDatePicker!
    @IBOutlet weak var salarySlider: UISlider!
    
    @IBOutlet weak var resulttextview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dobpicker.backgroundColor = UIColor.systemBrown
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSubmit(_ sender: Any) {
        var name = nametextfield!.text!
        var gender = ""
        
        if(gendersegment.selectedSegmentIndex == 0){
            gender = "Male"
        }else{
            gender = "Female"
        }
        
       var salary:Float = salarySlider.value
        var sal:Int = Int(Float(salary))
        var dob:Date = dobpicker.date
        
       var formatter:DateFormatter = DateFormatter()
        
        formatter.dateFormat = "dd-MM-yyyy"
        
      var strDate = formatter.string(from: dob)
        
        var str = "\(name) , \(gender) , salary:\(sal) , DOB:\(strDate)"
        resulttextview!.text = str
        
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        var i:Int = Int(salarySlider.value)
        salarylabel.text = "\(i)"
        
    }
    
    
}

