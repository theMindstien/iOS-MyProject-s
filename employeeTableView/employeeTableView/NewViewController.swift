//
//  NewViewController.swift
//  employeeTableView
//
//  Created by apple on 26/09/22.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var salField: UITextField!
    @IBOutlet weak var departField: UITextField!
    @IBOutlet weak var joiningDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    var employeeViewCon:ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func add(_ sender: Any) {
        let empid:Int = Int(idField!.text!)!
        let empname = nameField!.text!
        let sal:Float = Float(salField!.text!)!
        let dept = departField!.text!
        let joinDate = "Join Date:\(joiningDateLabel!.text!)"
        var dob:Date = datePicker.date
        
       var formatter:DateFormatter = DateFormatter()
        
        formatter.dateFormat = "dd-MM-yyyy"
        
      var strDate = formatter.string(from: dob)
        //var str =  "DOB:\(strDate)"
        joiningDateLabel!.text = strDate
        let empobj:employee = employee(empid: empid, empName: empname, salary: sal, depart: dept, joinDate: strDate)
        employeeViewCon!.employeeArray.append(empobj)
        employeeViewCon!.employeeListTableView?.reloadData()
        idField!.text = ""
        nameField!.text = ""
        salField!.text = ""
        departField!.text = ""
        joiningDateLabel!.text = ""
        
        
        dismiss(animated: true)
    }
    
   

}
