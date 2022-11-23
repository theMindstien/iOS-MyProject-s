//
//  ModifyCustomerViewController.swift
//  BankCustomerDetails
//
//  Created by apple on 11/11/22.
//

import UIKit
import Alamofire

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
        let accNo = Int(accNoField!.text!)!
        let bal = Int(balField!.text!)!
        let accType = accTypeField!.text!
        let email = emailField!.text!
        let pass = passFIeld!.text!
        let pDate = pDateField!.text!
        let cust = customerInfo(id: 0, name: name, gender: gender, accounttype: accType, account_no: accNo, email: email, balance: bal, pub_date: pDate, password: pass)
        let id = customerDetails["id"] as! Int
        
        AF.request("https://videhjaiswal.pythonanywhere.com/customer/customer_api/customers/\(id)/",method: HTTPMethod.put,parameters: cust,encoder: JSONParameterEncoder.default).response{
            
            response in
            
            if(response.response!.statusCode == 200){
               
                DispatchQueue.main.async {
                    
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
        }
        
        
        
        
        
        
        
        
        
        
 
    }
    


    
    @IBAction func onActionDelete(_ sender: Any) {
        deleteCustomer()
    }
        
        
        func deleteCustomer()
        {
                    let id =  customerDetails["id"] as! Int
                    
            AF.request("https://videhjaiswal.pythonanywhere.com/customer/customer_api/customers/\(id)/",method: HTTPMethod.delete).response{
                
                response in
                if(response.response?.statusCode==200){
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                    
                }
            }
            
        }

     

                }
        
        
