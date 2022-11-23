//
//  AddCustomerViewController.swift
//  BankCustomerDetails
//
//  Created by apple on 11/11/22.
//

import UIKit

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
       
//        submitButton.layer.borderWidth = 2
//        submitButton.layer.borderColor = UIColor.red.cgColor
//        submitButton.circleCorner()
//
//        nameField.setBorder(width: 2, color: UIColor.green)
//        nameField.circleCorner()
//        genderField.setBorder(width: 2, color: UIColor.systemPink)
//        genderField.circleCorner()
//        accNoFIeld.setBorder(width: 2, color: UIColor.blue)
//        accNoFIeld.circleCorner()
//        accTypeField.setBorder(width: 2, color: UIColor.systemPink)
//        accTypeField.circleCorner()
//        balanceField.setBorder(width: 2, color: UIColor.green)
//        balanceField.circleCorner()
//        emailField.setBorder(width: 2, color: UIColor.systemPink)
//        emailField.circleCorner()
//        passwordField.setBorder(width: 2, color: UIColor.green)
//        passwordField.circleCorner()
//        pubDateField.setBorder(width: 2, color: UIColor.systemPink)
//        pubDateField.circleCorner()
    }
    
    @IBAction func onActionAdd(_ sender: Any) {
        
        let name = nameField!.text!
        let gender = genderField!.text!
        let accNo = Int(accNoFIeld!.text!)
        let bal = Int(balanceField!.text!)
        let accType = accTypeField!.text!
        let email = emailField!.text!
        let pass = passwordField!.text!
        let pDate = pubDateField!.text!
        
        let customerData:[String:Any] = ["name":name,"gender":gender,"account_no":accNo,"balance":bal,"accounttype":accType,"email":email,"password":pass,"pub_date":pDate]
        
        
        do{

            let JsonData:Data = try JSONSerialization.data(withJSONObject: customerData, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            let jsonURL:String = "http://videhjaiswal.pythonanywhere.com/customer/customer_api/customers/register"
            let myURL:URL = URL(string: jsonURL)!
            var myReq:URLRequest = URLRequest(url: myURL)
            myReq.httpMethod = "POST"
            myReq.httpBody = JsonData
            
            myReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
            myReq.setValue("\(JsonData.count)", forHTTPHeaderField: "Content-Length")
            
            let urlSession = URLSession.shared
            let dataTask:URLSessionDataTask = urlSession.dataTask(with: myReq, completionHandler: jsonHandler(jsonData:resp:err:))
            
            dataTask.resume()
            print(JsonData)
            
        }catch{
            
            print("jason error")
            
        }
    }
    
    func jsonHandler(jsonData:Data?, resp:URLResponse?, err:Error?)
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
            
}
//extension UIView {
//    func setBorder(width: CGFloat, color: UIColor) {
//        layer.borderColor = color.cgColor
//        layer.borderWidth = width
//    }
//}
//
//extension UIView {
//  func circleCorner() {
//        superview?.layoutIfNeeded()
//        setCorner(radius: frame.height / 2)
//    }
//}
//extension UIView {
//  func setCorner(radius: CGFloat) {
//        layer.cornerRadius = radius
//        clipsToBounds = true
//    }
//}
