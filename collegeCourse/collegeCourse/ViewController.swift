//
//  ViewController.swift
//  collegeCourse
//
//  Created by apple on 13/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var courseSegment: UISegmentedControl!
    @IBOutlet weak var feesSlider: UISlider!
    @IBOutlet weak var feesLabel: UILabel!
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func actionGender(_ sender: Any) {
        var gender = ""
       
        if (genderSegment.selectedSegmentIndex == 0)
        {
            gender = "Male"
        }else
            if (genderSegment.selectedSegmentIndex == 1)
        {
                gender = "Female"
                
            }else{
                gender = "trans"
            }
        
}
    @IBAction func actionCourse(_ sender: Any) {
        var course = ""
        
        if(courseSegment.selectedSegmentIndex == 0){
            course = "B.E"
        }else
        if(courseSegment.selectedSegmentIndex == 1){
            course = "BBA"
        }else
        if(courseSegment.selectedSegmentIndex == 2){
                course = "BCA"
        
    }else
    if(courseSegment.selectedSegmentIndex == 3){
            course = "MBA"
    }else
    if(courseSegment.selectedSegmentIndex == 4){
            course = "B.SC"
    }else{
        course = "M.SC"
    }
     
}
    
    @IBAction func actionSubmit(_ sender: Any) {
        let name = nameField!.text!
        let age = ageField!.text!
        let fee:Float = feesSlider.value
        
        
    }
    
    @IBAction func feeSlider(_ sender: Any) {
        let i:Int = Int(feesSlider.value)
        feesLabel.text = "\(i)"
        
    }
    
    
}
