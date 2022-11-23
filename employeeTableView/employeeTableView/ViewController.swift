//
//  ViewController.swift
//  employeeTableView
//
//  Created by apple on 26/09/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var employeeListTableView: UITableView!
    var employeeArray:[employee] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let e1 = employee(empid: 101, empName: "Rahul", salary: 10000, depart: "manufacturing", joinDate: "02/01/1998")
        let e2 = employee(empid: 102, empName: "Deepak", salary: 15000, depart: "operations", joinDate: "13/09/2000")
        let e3 = employee(empid: 103, empName: "Sachin", salary: 25000, depart: "sales", joinDate: "24/06/2004")
        let e4 = employee(empid: 104, empName: "Gunjan", salary: 40000, depart: "Human Resource", joinDate: "17/01/1992")
        
        employeeArray.append(e1)
        employeeArray.append(e2)
        employeeArray.append(e3)
        employeeArray.append(e4)
        
        employeeListTableView?.dataSource = self
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        
        let empObj:employee = employeeArray[indexPath.row]
        cell.textLabel!.text = "Emp-Id:\(empObj.empid),Emp-Name:\(empObj.empName)"
        cell.detailTextLabel!.text = "Salary:\(empObj.salary),Dept:\(empObj.depart),JoiningDate\(empObj.joinDate)"
      //  cell.imageView?.image = UIImage(named: "Empimage")
        cell.backgroundColor = .cyan
        
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
                self.employeeArray.remove(at: indexPath.row)
                self.employeeListTableView!.deleteRows(at: [indexPath], with: .automatic)
                complete(true)
            }
            
            deleteAction.backgroundColor = .red
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = true
            return configuration
        }
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        print(indexPath.row, indexPath.section)
        //delete from array using indexPath.row and reload tableview
       employeeArray.remove(at: indexPath.row)
        employeeListTableView!.reloadData()
    }
    
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
                self.employeeArray.remove(at: indexPath.row)
                self.employeeListTableView!.deleteRows(at: [indexPath], with: .automatic)
            }
            deleteAction.backgroundColor = .red
            return [deleteAction]
        }
    
    

    @IBAction func actionNext(_ sender: Any) {
        let secondviewCon:NewViewController = storyboard!.instantiateViewController(withIdentifier: "screen2") as! NewViewController
        secondviewCon.employeeViewCon = self
        present(secondviewCon,animated: true)
        
    }
    
}

