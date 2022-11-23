//
//  AddPatientViewController.swift
//  JSONdemo2
//
//  Created by apple on 07/11/22.
//

import UIKit

class AddPatientViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.layer.borderWidth = 2
        submitButton.layer.borderColor = UIColor.red.cgColor
        submitButton.circleCorner()
        
        
        nameField.setBorder(width: 2, color: UIColor.green)
        nameField.circleCorner()
        ageField.setBorder(width: 2, color: UIColor.systemPink)
        ageField.circleCorner()
        genderField.setBorder(width: 2, color: UIColor.blue)
        genderField.circleCorner()

        
    }
    
    @IBAction func onActionSubmit(_ sender: Any) {
        
        let Pname = nameField!.text!
        let Page = Int(ageField!.text!)
        let gender = genderField!.text!
        
        let patientData:[String:Any] = ["name":Pname,"age":Page,"gender":gender]
        
        do{
            
            let JsonData:Data = try JSONSerialization.data(withJSONObject: patientData, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            let jsonURL:String = "https://todearhemant.pythonanywhere.com/patient/api/patients/"
            let myURL:URL = URL(string: jsonURL)!
            var myReq:URLRequest = URLRequest(url: myURL)
            myReq.httpMethod = "POST"
            myReq.httpBody = JsonData
            
            myReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
            myReq.setValue("\(JsonData.count)", forHTTPHeaderField: "Content-Length")
            
            let urlSession = URLSession.shared
            let dataTask = urlSession.dataTask(with: myReq, completionHandler: jsonHandler(jsonData:resp:err:))
            
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
                  let patientResponse:[String:Any] =  try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [String:Any]
                
            print(patientResponse)
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
extension UIView {
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

extension UIView {
  func circleCorner() {
        superview?.layoutIfNeeded()
        setCorner(radius: frame.height / 2)
    }
}
extension UIView {
  func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
