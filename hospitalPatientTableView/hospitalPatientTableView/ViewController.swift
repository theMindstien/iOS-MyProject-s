//
//  ViewController.swift
//  hospitalPatientTableView
//
//  Created by apple on 26/09/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource
{
   
    @IBOutlet weak var patientListTableView: UITableView!
    var patientArray:[hospitalPatient] = []
    
 
    
    override func viewDidLoad() {
        
        let p1 = hospitalPatient(patientName: "Ankit", age: 28, city: "Indore", doctorsName: "Dr.Prashant", primaryInvest: "done")
        let p2 = hospitalPatient(patientName: "Deepak", age: 28, city: "Bhopal", doctorsName: "Dr.Singh", primaryInvest: "done")
        let p3 = hospitalPatient(patientName: "Saroj", age: 32, city: "Sehore", doctorsName: "Dr.Dubey", primaryInvest: "done")
        
        patientArray.append(p1)
        patientArray.append(p2)
        patientArray.append(p3)
        
        patientListTableView?.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
           
        let objectHospital:hospitalPatient = patientArray:[indexPath.row]
        
        cell.textLabel!.text = "Patient Name:\()"
        
        
       return cell
    }
    
    
    
    
    

    @IBAction func actionRefresh(_ sender: Any) {
    }
    
    @IBAction func actionNext(_ sender: Any) {
        let secondScreenCon:NewViewController = storyboard!.instantiateViewController(withIdentifier: "screen2") as! NewViewController
        
        secondScreenCon.patientViewCon = self
        present(secondScreenCon,animated: true)
        
    }
}

