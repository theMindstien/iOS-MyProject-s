//
//  EmployeeTableViewController.swift
//  CoreDataDemo
//
//  Created by apple on 19/11/22.
//

import UIKit
import CoreData

class EmployeeTableViewController: UITableViewController {
    
    var empArray:[NSManagedObject] = []

    override func viewDidLoad() {
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        let context:NSManagedObjectContext = ViewController.getContext()
        let req:NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        do{
            empArray = try context.fetch(req) as! [NSManagedObject]
            print(empArray.count)
            self.tableView.reloadData()
        }
        catch{
            print("error while fatching data")
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return empArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        
        let emp:NSManagedObject = empArray[indexPath.row]
        print(emp,empArray)
        let ID = emp.value(forKey: "emp_id")
        let name = emp.value(forKey: "emp_name")
        let sal = emp.value(forKey: "emp_salary")
        let Depart = emp.value(forKey: "emp_depart")
        
        cell.textLabel!.text = "\(ID!),\(name!)"
        cell.detailTextLabel!.text = "\(sal!),\(Depart!)"
        
     

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedEmployee:NSManagedObject = empArray[indexPath.row]
        let empName = selectedEmployee.value(forKey: "emp_name") as! String
        
        print(empName)
        // code for alert box
        let alertCon:UIAlertController = UIAlertController(title: "Select Action", message: "Employee:\(empName)", preferredStyle: UIAlertController.Style.alert)
        
        // code for delete action
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: {(action:UIAlertAction)
            in
            do{
                let context = ViewController.getContext()
                context.delete(selectedEmployee)
                try context.save()
                self.empArray.remove(at: indexPath.row)
                self.tableView.reloadData()
                
                
                
            }catch{
                
                print("error while deleting data",error)
                
            }
            
            
            
            
            
            
            
        })
        
        alertCon.addAction(deleteAction)
        //code for update action
        
        let updateAction:UIAlertAction = UIAlertAction(title: "Update", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction?)in
            
            let updateCon:UpdateViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
            
            updateCon.onActionUpdate = selectedEmployee
            self.navigationController?.pushViewController(updateCon, animated: true)
            
})
        alertCon.addAction(updateAction)
        
        
        
        
        
        
        // code for cancel action
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertCon.addAction(cancelAction)
        self.present(alertCon, animated: true, completion: nil)
        
        
    }
}
   
