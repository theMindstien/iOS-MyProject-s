//
//  AddCustomerViewController.swift
//  BankCustomerDetails
//
//  Created by apple on 11/11/22.
//

import UIKit
import Alamofire

class AddCustomerViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var accNoFIeld: UITextField!
    @IBOutlet weak var accTypeField: UITextField!
    @IBOutlet weak var balanceField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var pubDateField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    
    @IBAction func onActionAdd(_ sender: Any) {
        
        let name = nameField!.text!
        let gender = genderField!.text!
        let accNo = Int(accNoFIeld!.text!)!
        let bal = Int(balanceField!.text!)!
        let accType = accTypeField!.text!
        let email = emailField!.text!
        let pass = passwordField!.text!
        let pDate = pubDateField!.text!
        
        let cust = customerInfo(id: 0, name: name, gender: gender, accounttype: accType, account_no: accNo, email: email, balance: bal, pub_date: pDate, password: pass)
        
        AF.request("https://videhjaiswal.pythonanywhere.com/customer/customer_api/customers/register",method: HTTPMethod.post,parameters: cust,encoder: JSONParameterEncoder.default).response{
            
            response in
            print("data",response.data)
            print("Err:",response.error)
            print("httpResp",response.response?.statusCode)
            if (response.response?.statusCode == 201){
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
        
}
    


