//
//  ViewController.swift
//  BankCustomerDetails
//
//  Created by apple on 08/11/22.
//

import UIKit

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
        
     
        cell.idLabel!.text = "\(id)"
        cell.nameLabel!.text = "\(name)"
        cell.genderLabel!.text = "\(gender)"
        cell.accNoLabel!.text = "\(account_no)"
        cell.accTypeLabel!.text = "\(accounttype)"
        cell.balLabel!.text = "\(balance)"
        cell.emailLabel!.text = "\(email)"
        cell.passwordLabel!.text = "\(password)"
        cell.PubDateLabel!.text = "\(pub_date)"
        
       return cell
        
    }
    
    
    func downloadJSON()
    {
        let jsonURL:String="https://videhjaiswal.pythonanywhere.com/customer/customer_api/customers/"
        let myURL:URL = URL(string: jsonURL)!
        var myReq:URLRequest = URLRequest(url: myURL)
        myReq.httpMethod="GET"
        
        let urlSession = URLSession.shared
        let dataTask:URLSessionDataTask = urlSession.dataTask(with: myReq, completionHandler: jsonHandler(jsonData:resp:err:))
        
        dataTask.resume()
        
    }
    func jsonHandler(jsonData:Data?, resp:URLResponse?, err:Error?)
    {
        print(jsonData)
        if(jsonData != nil)
        {
            print(jsonData)
              do{
                swiftData =  try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [[String:Any]]
                
                print(swiftData)
                DispatchQueue.main.async {
                    self.customerTableView.reloadData()
                }
                
                
            }catch{
                print("JSON error ", error)
            }
            
            print("Download done!!!!")
        }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modifycon:ModifyCustomerViewController = self.storyboard?.instantiateViewController(withIdentifier: "ModifyCustomerViewController") as! ModifyCustomerViewController
        
        let dataDictionary:[String:Any] = swiftData[indexPath.row]
        modifycon.customerDetails = dataDictionary
        self.navigationController?.pushViewController(modifycon, animated: true)
    }




    }
    

