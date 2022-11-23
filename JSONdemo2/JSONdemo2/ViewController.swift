//
//  ViewController.swift
//  JSONdemo2
//
//  Created by apple on 04/11/22.
//

import UIKit


class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate
{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var swiftData:[[String:Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
//        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "addimg")
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "addimg")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        downloadJson()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyTableViewCell
        
        let dataDictionary:[String:Any] = swiftData[indexPath.row]
        
        let id = dataDictionary["id"] as! Int
        let name = dataDictionary["name"] as! String
        let age = dataDictionary["age"] as! Int
        let gender = dataDictionary["gender"] as! String
        
      //  let PInfo:patientInfo = swiftData [[indexPath.row]]
        
        
        cell.idLabel!.text = "ID:\(id)"
        cell.nameLabel!.text = "Name:\(name)"
        cell.ageLabel!.text = "Age:\(age)"
        cell.genderLabel!.text = "Gen:\(gender)"
        
        return cell
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
    
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            let  modifycon:ModifyViewController = self.storyboard?.instantiateViewController(withIdentifier: "ModifyViewController") as! ModifyViewController
            let dataDictionary:[String:Any] = swiftData[indexPath.row]

            modifycon.patientDetails = dataDictionary

                self.navigationController?.pushViewController(modifycon, animated: true)


        }
        
       
        
    }

