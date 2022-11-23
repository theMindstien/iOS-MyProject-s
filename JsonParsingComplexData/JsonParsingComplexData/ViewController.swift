//
//  ViewController.swift
//  JsonParsingComplexData
//
//  Created by apple on 03/11/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource
{
    
   
    @IBOutlet weak var tableView: UITableView!
    var swiftData:[[String:Any]] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        
        let dataDictionary:[String:Any] = swiftData[indexPath.row]
        
        let id = dataDictionary["id"] as! Int
        let name = dataDictionary["name"] as! String
        let username = dataDictionary["username"] as! String
        let  email = dataDictionary["email"] as! String
        let phone = dataDictionary["phone"] as! String
        let address = dataDictionary["address"] as! [String:Any]
        let city = address["city"] as! String
        let company = dataDictionary["company"] as![String:Any]
        let CName = company["name"] as! String
        
        cell.textLabel?.text = "\(id),\(name),\(username)"
        cell.detailTextLabel?.text = "\(city),\(email),\(phone),\(CName)"
        
    
        
        
        
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        JSONdownload()
    }

    
    func JSONdownload(){
        let jsonURL:String = "https://jsonplaceholder.typicode.com/users/"
        let myURL:URL = URL(string: jsonURL)!
        
        var myReq:URLRequest = URLRequest(url: myURL)
        
        myReq.httpMethod = "GET"
        
        let URLSession = URLSession.shared
        let dataTask = URLSession.dataTask(with: myReq, completionHandler: JSONhandler(jsonData:Response:Error:))
        
        dataTask.resume()
    }

    func JSONhandler(jsonData:Data?,Response:URLResponse?,Error:Error?){
        
        if(jsonData != nil){
            print(jsonData!)
            //print(Response!)
            
            do{
                 swiftData = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [[String : Any]]
                
                print(swiftData)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch{
                print("JSON ERROR")
            }
            print ("DOWNLOAD COMPLETED")
        }
        
        
    }
    
    
}

