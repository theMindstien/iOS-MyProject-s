//
//  ViewController.swift
//  BankCustomerDetails
//
//  Created by apple on 08/11/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate
{
    
   
    
@IBOutlet weak var customerTableView: UITableView!

    var swiftData:[[String:Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerTableView.dataSource = self
       customerTableView.delegate = self
        
      let nib:UINib = UINib(nibName: "CustomerTableViewCell", bundle: nil)
       customerTableView.register(nib, forCellReuseIdentifier: "custom_cell")
      // customerTableView.dataSource = self
        // Do any additional setup after loading the view.
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        downloadJSON()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
{
    return swiftData.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

    let cell:CustomerTableViewCell = customerTableView.dequeueReusableCell(withIdentifier: "custom_cell") as! CustomerTableViewCell
        let dataDictinary:[String:Any] = swiftData[indexPath.row]

        let id = dataDictinary["id"] as! Int
        let name = dataDictinary["name"] as! String
        let gender = dataDictinary["gender"] as! String
        let account_no = dataDictinary["account_no"] as! Int
        let balance = dataDictinary["balance"] as! Int
        let accounttype = dataDictinary["accounttype"] as! String
        let email = dataDictinary["email"] as! String
        let password = dataDictinary["password"] as! String
        let pub_date = dataDictinary["pub_date"] as! String
        
     
        cell.idLabel!.text = "Id:\(id)"
        cell.nameLabel!.text = "\(name)"
        cell.genderLabel!.text = "Gen:\(gender)"
        cell.accNoLabel!.text = "Acc/No:\(account_no)"
        cell.accTypeLabel!.text = "Acc/typ:\(accounttype)"
        cell.balLabel!.text = "Bal:\(balance)"
        cell.emailLabel!.text = "Email:\(email)"
        cell.passwordLabel!.text = "Pass:\(password)"
        cell.PubDateLabel!.text = "Date:\(pub_date)"
        
       return cell
        
    }
    
    
    func downloadJSON()
    
    {
        
        AF.request("https://videhjaiswal.pythonanywhere.com/customer/customer_api/customers/",method: HTTPMethod.get).response{
            response in
            print(response)
            print(response.data)
            print(response.error)
            print(response.response?.statusCode)
            
            do{
                self.swiftData = try JSONSerialization.jsonObject(with:response.data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [[String : Any]]
                print(self.swiftData)

                DispatchQueue.main.async {
                    self.customerTableView.reloadData()
                }
            }
       catch{
            print("jason error",error)

        }

 }

        
}
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modifycon:ModifyCustomerViewController = self.storyboard?.instantiateViewController(withIdentifier: "ModifyCustomerViewController") as! ModifyCustomerViewController
        
        let dataDictionary:[String:Any] = swiftData[indexPath.row]
        modifycon.customerDetails = dataDictionary
        self.navigationController?.pushViewController(modifycon, animated: true)
    }




    }
    

