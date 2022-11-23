//
//  ViewController.swift
//  JASONParsing
//
//  Created by apple on 02/11/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        
        let dataDictionary:[String:Any] = swiftData[indexPath.row]
        
        let id = dataDictionary["id"]as! Int
        let userId = dataDictionary["userId"] as! Int
        let title = dataDictionary["title"] as! String
        let comp = dataDictionary["completed"] as! Int
        
        cell.textLabel!.text = "\(id),\(userId),\(comp)"
        cell.detailTextLabel!.text = title
        return cell
        
    }
    
    @IBOutlet weak var jasonTableView: UITableView!
    var swiftData:[[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        jasonTableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        downloadJSON()
    }

    
 func downloadJSON()
    {
        let jsonURL:String = "https://jsonplaceholder.typicode.com/todos/"
        let myURL:URL = URL(string: jsonURL)!
        var myReq:URLRequest = URLRequest(url: myURL)
        
        myReq.httpMethod = "GET"
        
        let urlSession = URLSession.shared
        
        let dataTask = urlSession.dataTask(with: myReq, completionHandler: jsonHandler(jasonData:resp:err:))
        
        dataTask.resume()
        
        
    }
    
    func jsonHandler(jasonData:Data?,resp:URLResponse?,err:Error?)
    {
        if(jasonData != nil){
            
            print(jasonData!)
            print(resp!)
            
            do{
                swiftData = try JSONSerialization.jsonObject(with: jasonData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [[String : Any]]
                print(swiftData)
                
                DispatchQueue.main.async {
                    self.jasonTableView.reloadData()
                }
                
            }catch{
                print("jason Error",error)
            }
            print("download completed")
            
        }
    }
    

}

