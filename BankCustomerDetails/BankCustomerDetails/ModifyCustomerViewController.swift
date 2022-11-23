//
//  ModifyCustomerViewController.swift
//  BankCustomerDetails
//
//  Created by apple on 11/11/22.
//

import UIKit

class ModifyCustomerViewController: UIViewController {
    
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var accNoField: UITextField!
    @IBOutlet weak var accTypeField: UITextField!
    @IBOutlet weak var balField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passFIeld: UITextField!
    @IBOutlet weak var pDateField: UITextField!
    @IBOutlet weak var udateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var customerDetails:[String:Any] = [:]
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        idLabel.setBorder(width: 2, color:UIColor.magenta)
//        idLabel.circleCorner()
//
//        udateButton.layer.borderWidth = 2
//        udateButton.layer.borderColor = UIColor.green.cgColor
//        udateButton.circleCorner()
//        deleteButton.layer.borderWidth = 2
//        deleteButton.layer.borderColor = UIColor.red.cgColor
//        deleteButton.circleCorner()
//        nameField.setBorder(width: 2, color: UIColor.green)
//        nameField.circleCorner()
//        genderField.setBorder(width: 2, color: UIColor.systemPink)
//        genderField.circleCorner()
//        accNoField.setBorder(width: 2, color: UIColor.green)
//        accNoField.circleCorner()
//        accTypeField.setBorder(width: 2, color: UIColor.systemPink)
//        accTypeField.circleCorner()
//        balField.setBorder(width: 2, color: UIColor.green)
//        balField.circleCorner()
//        emailField.setBorder(width: 2, color: UIColor.systemPink)
//        emailField.circleCorner()
//
//       passFIeld.setBorder(width: 2, color: UIColor.green)
//       passFIeld.circleCorner()
//
//        pDateField.setBorder(width: 2, color: UIColor.systemPink)
//        pDateField.circleCorner()

        idLabel!.text = String(customerDetails["id"] as! Int)
        nameField!.text = customerDetails["name"] as! String
        accNoField!.text = String(customerDetails["account_no"] as! Int)
        balField!.text = String(customerDetails["balance"] as! Int)
        genderField!.text = customerDetails["gender"] as! String
        accTypeField!.text = customerDetails["accounttype"] as! String
        emailField!.text = customerDetails["email"] as! String
        passFIeld!.text = customerDetails["password"] as! String
        pDateField!.text = customerDetails["pub_date"] as! String
        
    }
    
    
    
    
    @IBAction func onActionUpdate(_ sender: Any)
    {
        
        
        let name = nameField!.text!
        let gender = genderField!.text!
        let accNo = Int(accNoField!.text!)
        let bal = Int(balField!.text!)
        let accType = accTypeField!.text!
        let email = emailField!.text!
        let pass = passFIeld!.text!
        let pDate = pDateField!.text!
        
        let customerData:[String:Any] = ["name":name,"gender":gender,"account_no":accNo,"balance":bal,"accounttype":accType,"email":email,"password":pass,"pub_date":pDate]
        
        
        do{
            
            let JsonData:Data = try JSONSerialization.data(withJSONObject: customerData, options: JSONSerialization.WritingOptions.prettyPrinted)
            let id = customerDetails["id"] as! Int
            let jsonURL:String = "https://videhjaiswal.pythonanywhere.com/customer/customer_api/customers/\(id)/"
            let myURL:URL = URL(string: jsonURL)!
            var myReq:URLRequest = URLRequest(url: myURL)
            myReq.httpMethod = "PUT"
            myReq.httpBody = JsonData
            
            myReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
            myReq.setValue("\(JsonData.count)", forHTTPHeaderField: "Content-Length")
            
            let urlSession = URLSession.shared
            let dataTask = urlSession.dataTask(with: myReq, completionHandler: updateCustomerHandler(jsonData:resp:err:))
            
            dataTask.resume()
            print(JsonData)
            
        }catch{
            
            print("jason error")
            
        }
   
    }
    
    func updateCustomerHandler(jsonData:Data?, resp:URLResponse?, err:Error?)
    {
        if(jsonData != nil)
        {
            print(jsonData)
              do{
                  let customerResponse:[String:Any] =  try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [String:Any]
                
            print(customerResponse)
                  DispatchQueue.main.async {
                      self.navigationController?.popViewController(animated: true)
                      
                  }
                
            }catch{
                print("JSON error ", error)
            }
            
            print("Download done!!!!")
        }
       
    }
            

    
    @IBAction func onActionDelete(_ sender: Any) {
        deleteCustomer()
    }
        
        
        func deleteCustomer()
        {
                    let id =  customerDetails["id"] as! Int
                    
                    
                    let JsonURL:String = "https://videhjaiswal.pythonanywhere.com/customer/customer_api/customers/\(id)/"
                    let myURL:URL = URL(string: JsonURL)!
                    var req:URLRequest = URLRequest(url: myURL)
                    req.httpMethod = "DELETE"
                    
                    let urlSession:URLSession = URLSession.shared
                    let dataTask = urlSession.dataTask(with: req, completionHandler: deleteCustomerHandler(data:resp:err:))
                    
                    dataTask.resume()
                }
        
        
        func deleteCustomerHandler(data:Data?,resp:URLResponse?,err:Error?)
        {
          
            let httpResponse = resp as! HTTPURLResponse
            
            if(httpResponse.statusCode == 204){
                
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }

        
        
      }
    
   }
}
   
