//
//  ViewController.swift
//  fruitListTableView
//
//  Created by apple on 23/09/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var fruitTableView: UITableView!
    
    
    var fruitArray:[String]=[]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitTableView.dataSource = self
       // fruitTableView.delegate = self
   
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return fruitArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        cell.backgroundColor = .cyan
        cell.tintColor = .black
        
        if(indexPath.section == 0){
            let list = fruitArray[indexPath.row]
            cell.textLabel?.text = "\(list)"
          
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0){
            return "Fruits Name"
            
        }
          return ""
        
       }

    @IBAction func actionNext(_ sender: Any) {
        let secondScreenCon:SecondViewController = storyboard!.instantiateViewController(withIdentifier: "screen2") as! SecondViewController
            
        secondScreenCon.fruitViewCon = self
         present(secondScreenCon,animated: true)
            
        }
    }
    


