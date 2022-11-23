//
//  ViewController.swift
//  zooTableView
//
//  Created by apple on 23/09/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var animalListTableView: UITableView!
    var animalArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animalListTableView.dataSource = self
        animalListTableView.delegate = self
    }

    // func for sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // func for rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return animalArray.count
           }
        return 0
      }
    
    //func for cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        cell.backgroundColor = .cyan
        cell.tintColor = .black
        
        
        if(indexPath.section == 0){
            let list = animalArray[indexPath.row]
            cell.textLabel?.text = "\(list)"
          
        }
        return cell
        
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0){
            return "Animal Name"
            
        }
          return ""
        
       }
    
   // to add animal on tableview list
    
    @IBAction func actionAdd(_ sender: Any) {
        let name = nameField!.text!
         if(name.count > 0){
             animalArray.append(name)
             animalListTableView.reloadData()
             nameField!.text = ""
         }
        }
    
    // to fetch row data of specific section - didselectrow
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var rawData = ""
        if(indexPath.section == 0){
            rawData = animalArray[indexPath.row]
            
            //alert controller box
            
            let alert:UIAlertController = UIAlertController(title: "You Want to Select - ", message: rawData, preferredStyle: UIAlertController.Style.alert)
            
            
            // to add button on alert box
            let okAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okAction)
            
            // to add remove button on alert box
            let deleteAction:UIAlertAction = UIAlertAction(title: "REMOVE", style: UIAlertAction.Style.destructive, handler: nil) // write closure code here
            alert.addAction(deleteAction)
             present(alert,animated: true)
            
        }
    }
    
    
}

