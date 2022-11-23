//
//  NewViewController.swift
//  hospitalPatientTableView
//
//  Created by apple on 26/09/22.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var doctornameField: UITextField!
    
    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var patientViewCon:ViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionSubmit(_ sender: Any) {
        let pname = nameField!.text!
        let age:Int = Int(ageField!.text!)!
        let city = cityField!.text!
        let dname = doctornameField!.text!
        var gen:String = ""
        let date = "Date:\(datelabel!.text!)"
        var dob:Date = datePicker.date
        
       var formatter:DateFormatter = DateFormatter()
        
        formatter.dateFormat = "dd-MM-yyyy"
        
      var strDate = formatter.string(from: dob)
        var str =  "DOB:\(strDate)"
        switch(genderSegment!.selectedSegmentIndex){
        case 0:
            gen = "Male"
        case 1:
            gen = "Female"
        default:
            printContent("Enter valid choice")
        }
        
        
        let hosobj:hospitalPatient =  hospitalPatient(patientName: pname, age: age, city: city, doctorsName: dname,date:str,gender:gen)
      
        patientViewCon!.patientArray.append(hosobj)
        patientViewCon!.patientListTableView.reloadData()
        nameField!.text = ""
        ageField!.text = ""
        cityField!.text = ""
        doctornameField!.text = ""
        datelabel!.text = ""
        dismiss(animated: true)
    }
    
   

}
