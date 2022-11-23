//
//  ViewController.swift
//  SQLiteHospital
//
//  Created by apple on 17/10/22.
//

import UIKit
import SQLite3

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    
    

    var patientData:[[Int:String]] = []
    @IBOutlet weak var patientTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        patientTableView.dataSource = self
        patientTableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        let q = "select * from patient_info"
        
        patientData = SQLiteWrapper.executeSelectQuery(query: q)
        print(patientData)
        
        patientTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        
        let patient:[Int:String] = patientData[indexPath.row]
        let id = patient[0]!
        let name = patient[1]!
        let age = patient[2]!
        let gender = patient[3]!
        
        cell.textLabel!.text = "P_Id:\(id),P_Name:\(name)"
        cell.detailTextLabel!.text = "P_Age:\(age),P_gender:\(gender)"
        cell.backgroundColor = .brown
        
        return cell
    }
    // show option for update and delete
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let patient = patientData[indexPath.row]
        
        let alert = UIAlertController(title: "Select Choice", message: "Patient-\(patient[1]!)", preferredStyle: UIAlertController.Style.alert)
        
        let deleteButton = UIAlertAction(title: "DELETE", style: UIAlertAction.Style.destructive, handler: {
            (action:UIAlertAction?)-> Void
            in
            let q1 = "Delete from patient_info where p_id = \(patient[1]!)"
            
            SQLiteWrapper.executeNonSelectQuery(query: q1)
            self.patientData.remove(at: indexPath.row)
            self.patientTableView.reloadData()
            
            
            
        })
        
        
        let updateButton = UIAlertAction(title: "UPDATE", style: UIAlertAction.Style.default, handler: {
            
            (action:UIAlertAction?)-> Void
            in
            
            let updateCon = self.storyboard!.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
            
            updateCon.patientUpdate = patient
           
            self.navigationController?.pushViewController(updateCon, animated: true)
        })
        
        let cancelButton = UIAlertAction(title: "(X)CANCEL", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(deleteButton)
        alert.addAction(updateButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true)
    }
    
    
    
}

