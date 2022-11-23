//
//  ViewController.swift
//  sliderDatePickerTextview
//
//  Created by apple on 12/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var studentName: UITextField!
    
    @IBOutlet weak var standard: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderdisplay: UILabel!
    
    @IBOutlet weak var dobpicker: UIDatePicker!
    
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(sender: Any) {
        let name = studentName!.text!
        let standard = standard!.text!
        var selectgender = ""
        
        if(gender.selectedSegmentIndex == 0){
            selectgender = "Male"
            
        }else if(gender!.selectedSegmentIndex == 1){
            selectgender = "Female"
            }else if(gender!.selectedSegmentIndex == 2)
        {
                selectgender = "Trans"
            }
        let fees:Float = slider.value
        let dob:Date = dobpicker.date
        
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyy"
        
        let strdate = formatter.string(from: dob)
        
        let str = "\(name),\(standard),\(fees),\(strdate)"
        resultTextView!.text = str
    }
    
    
    @IBAction func sliderchange(_ sender: Any) {
        
        print(slider.value)
        let i:Int = Int(slider.value)
        resultTextView!.text  = "\(i)"
    }
    
    
}

