//
//  ViewController.swift
//  jasonDemo
//
//  Created by apple on 03/11/22.
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
        
        let id = dataDictionary["id"] as! Int
        let name = dataDictionary["name"] as! String
        let age = dataDictionary["age"] as! Int
        let gender = dataDictionary["gender"] as! String
         
        cell.textLabel!.text = "\(id),\(name)"
        cell.detailTextLabel!.text = "\(gender),\(age)"
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    var swiftData:[[String:Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        downloadJson()
    }
    func downloadJson(){
        let jsonURL:String = "https://todearhemant.pythonanywhere.com/patient/api/patients/"
        let myURL:URL = URL(string: jsonURL)!
        var myREQ:URLRequest = URLRequest(url: myURL)
        
        myREQ.httpMethod = "GET"
        
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: myREQ, completionHandler: jsonHandler(jsondata:resp:err:))
        
        dataTask.resume()
    }
    
    func jsonHandler(jsondata:Data?,resp:URLResponse?,err:Error?){
        if(jsondata != nil){
            print(jsondata!)


            do{
             swiftData = try JSONSerialization.jsonObject(with: jsondata!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [[String : Any]]
                print(swiftData)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
       catch{
            print("jason error",error)

        }

            print("Download Completed")
        }
    }
}

