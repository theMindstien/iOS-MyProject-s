//
//  AddPatientViewController.swift
//  SQLiteHospital
//
//  Created by apple on 17/10/22.
//

import UIKit

class AddPatientViewController: UIViewController {
    
    @IBOutlet weak var idField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var genderField: UITextField!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
 
    @IBAction func actionOnSubmit(_ sender: Any) {
        
        let id = idField!.text!
        let name = nameField!.text!
        let age = ageField!.text!
        let gender = genderField!.text!
        print(id,name,age,gender)
     
        
        let q = "insert into patient_info (p_id,p_name,p_age,p_gender) values(\(id),'\(name)',\(age),'\(gender)')"
        
        SQLiteWrapper.executeNonSelectQuery(query: q)
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
