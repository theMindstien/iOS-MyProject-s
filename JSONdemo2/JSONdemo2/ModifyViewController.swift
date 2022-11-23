//
//  ModifyViewController.swift
//  JSONdemo2
//
//  Created by apple on 07/11/22.
//

import UIKit

class ModifyViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    var patientDetails:[String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        idLabel.setBorder(width: 2, color:UIColor.magenta)
        idLabel.circleCorner()
        
        updateButton.layer.borderWidth = 2
        updateButton.layer.borderColor = UIColor.green.cgColor
        updateButton.circleCorner()
        deleteButton.layer.borderWidth = 2
        deleteButton.layer.borderColor = UIColor.red.cgColor
        deleteButton.circleCorner()
        nameField.setBorder(width: 2, color: UIColor.green)
        nameField.circleCorner()
        ageField.setBorder(width: 2, color: UIColor.systemPink)
        ageField.circleCorner()
        genderField.setBorder(width: 2, color: UIColor.blue)
        genderField.circleCorner()
        
       
        idLabel!.text = String(patientDetails["id"] as! Int)
        nameField!.text = patientDetails["name"] as! String
        ageField!.text = String(patientDetails["age"] as! Int)
        genderField!.text = patientDetails["gender"] as! String
       
    }
    
    
    
    @IBAction func onActionUpdate(_ sender: Any) {
        
        let Pname = nameField!.text!
        let Page = Int(ageField!.text!)
        let gender = genderField!.text!
        
        let patientNewData:[String:Any] = ["name":Pname,"age":Page,"gender":gender]
        
        do{
            
            let JsonData:Data = try JSONSerialization.data(withJSONObject: patientNewData, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            let id = patientDetails["id"] as! Int
            
            
            let JsonURL:String = "https://todearhemant.pythonanywhere.com/patient/api/patients/\(id)/"
            let myURL:URL = URL(string: JsonURL)!
            var myReq:URLRequest = URLRequest(url: myURL)
            myReq.httpMethod = "PUT"
            myReq.httpBody = JsonData
            
            myReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
            myReq.setValue("\(JsonData.count)", forHTTPHeaderField: "Content-Length")
            
            let urlSession = URLSession.shared
            let dataTask = urlSession.dataTask(with: myReq, completionHandler:updatePatientHandler(data:resp:err:))
            
            dataTask.resume()
            print(JsonData)
            
        }catch{
            
            print("jason error")
            
        }
    }
    
    
        
        
        
        func updatePatientHandler(data:Data?,resp:URLResponse?,err:Error?)
        {
          
            let httpResponse = resp as! HTTPURLResponse
            
            if(httpResponse.statusCode == 200){
                
                DispatchQueue.main.async {
              self.navigationController?.popViewController(animated: true)
          }
     
       
    }
}
    
   
    @IBAction func onActionDelete(_ sender: Any) {
        deletePatient()
       }
           
       
   func deletePatient()
   {
               let id = patientDetails["id"] as! Int
               
               
               let JsonURL:String = "https://todearhemant.pythonanywhere.com/patient/api/patients/\(id)/"
               let myURL:URL = URL(string: JsonURL)!
               var req:URLRequest = URLRequest(url: myURL)
               req.httpMethod = "DELETE"
               
               let urlSession:URLSession = URLSession.shared
               let dataTask = urlSession.dataTask(with: req, completionHandler: deletePatientHandler(data:resp:err:))
               
               dataTask.resume()
           }
       
       
           
           func deletePatientHandler(data:Data?,resp:URLResponse?,err:Error?)
           {
             
               let httpResponse = resp as! HTTPURLResponse
               
               if(httpResponse.statusCode == 204){
                   
                   DispatchQueue.main.async {
                 self.navigationController?.popViewController(animated: true)
             }
    }
}
    
}

