//
//  UpdateViewController.swift
//  SQLiteHospital
//
//  Created by apple on 17/10/22.
//

import UIKit

class UpdateViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    
    var patientUpdate:[Int:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel!.text = patientUpdate[0]!
        nameField!.text = patientUpdate[1]!
        ageField!.text = patientUpdate[2]!
        genderField!.text = patientUpdate[3]!
        
        
    }
    
    @IBAction func actionOnUpdate(_ sender: Any) {
        let id = idLabel!.text!
        let name = nameField!.text!
        let age = ageField!.text!
        let gender = genderField!.text!
        
       let updateQur = "update patient_info set p_name = '\(name)',p_age = \(age), p_gender = '\(gender)'where p_id = \(id)"
        
        SQLiteWrapper.executeNonSelectQuery(query: updateQur)
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
