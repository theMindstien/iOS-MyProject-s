//
//  UpdateViewController.swift
//  CoreDataDemo
//
//  Created by apple on 21/11/22.
//

import UIKit
import CoreData

class UpdateViewController: UIViewController {
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var departField: UITextField!
    @IBOutlet weak var salField: UITextField!
    
    var onActionUpdate:NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(onActionUpdate != nil){
            
            let id = onActionUpdate!.value(forKey: "emp_id") as! Int16
            let name = onActionUpdate!.value(forKey: "emp_name") as! String
            let depart = onActionUpdate!.value(forKey: "emp_depart") as! String
            let sal = onActionUpdate!.value(forKey: "emp_salary") as! Float
            
            idField!.text = String (id)
            nameField!.text = name
            departField!.text = depart
            salField!.text = String(sal)
        
    }
    }
    
    @IBAction func onActionUpdate(_ sender: Any) {
        
        let context:NSManagedObjectContext = ViewController.getContext()
        
        let id  =  Int16 (idField!.text!)
        let name = nameField!.text!
        let dept = departField!.text!
        let sal = Float(salField!.text!)!
        
        print(id,name,dept,sal)
        onActionUpdate!.setValue(id, forKey: "emp_id")
        onActionUpdate!.setValue(name, forKey: "emp_name")
        onActionUpdate!.setValue(dept, forKey: "emp_depart")
        onActionUpdate!.setValue(sal, forKey: "emp_salary")
         
        do{
            try context.save()
            print("data updation done")
            
            self.navigationController?.popViewController(animated: true)
        }
        catch{
            print("Error during updating data",error)
        }
        
    }
    
    

}


