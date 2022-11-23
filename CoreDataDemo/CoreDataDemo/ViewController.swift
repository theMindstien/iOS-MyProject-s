//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by apple on 19/11/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var departField: UITextField!
    @IBOutlet weak var salaryField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onActionSubmit(_ sender: Any) {
        
        let context:NSManagedObjectContext = ViewController.getContext()
        
        let id  = Int16(idField!.text!)!
        let name = nameField!.text!
        let depart = departField!.text!
        let sal = Float(salaryField!.text!)!
        
        let empObj:NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
        empObj.setValue(id, forKey: "emp_id")
        empObj.setValue(name, forKey: "emp_name")
        empObj.setValue(depart, forKey: "emp_depart")
        empObj.setValue(sal, forKey: "emp_salary")
        
        do{
        try context.save()
            print("Data Saved")
            idField.text = ""
            nameField.text = ""
            departField.text = ""
            salaryField.text = ""
        
    }
        catch{
            print("error during saving data",error)
            
        }
    }
    
       static func getContext() -> NSManagedObjectContext
    {
        let app = UIApplication.shared
        let del:AppDelegate = app.delegate as! AppDelegate
        let context:NSManagedObjectContext = del.persistentContainer.viewContext
        return context
        
    }
    
}

