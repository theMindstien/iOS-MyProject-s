//
//  ViewController.swift
//  MallTableView
//
//  Created by apple on 22/09/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var categoryField: UITextField!
    
    @IBOutlet weak var itemListTableView: UITableView!
    
    var categoryArray:[String] = []
    var itemsArray:[String] = []
    
    override func viewDidLoad() {
        
//        categoryArray.append("Grocery")
//        categoryArray.append("Clothing")
//        categoryArray.append("Technology")
//        categoryArray.append("Pet store")
//        categoryArray.append("Department store")
//        categoryArray.append("Bakery")
//        categoryArray.append("Pharmacy")
//
//        itemsArray.append("Food items")
//        itemsArray.append("jeans")
//        itemsArray.append("laptop")
//        itemsArray.append("digene syrup")
//
//
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        itemListTableView.dataSource = self
        itemListTableView.delegate = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        if(section == 0){
            return categoryArray.count
        }
        if(section == 1){
            return itemsArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = UITableViewCell()
        if(indexPath.section == 0)
        {
            let list = categoryArray[indexPath.row]
            cell.textLabel?.text = "\(list)"
        }
        if(indexPath.section == 1){
            let list = itemsArray[indexPath.row]
            cell.textLabel?.text = "\(list)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "#Category#"
        }
        if(section == 1){
            return "#Items# "
        }
        return ""
    }
    
    
    
    @IBAction func actionAdd(_ sender: Any) {
        
        let item = itemField!.text!
        let category = categoryField!.text!
        if(item.count>0){
            itemsArray.append(item)
           itemListTableView.reloadData()
            itemField!.text = ""
        }
        else if(category.count>0){
            categoryArray.append(category)
            itemListTableView.reloadData()
            categoryField!.text = ""
        }
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var rawData = ""
        if(indexPath.section == 0)
        {
            rawData = categoryArray[indexPath.row]
            
        }else if(indexPath.section == 1)
        {
            rawData = itemsArray[indexPath.row]
            
        }
 
       // alert controller
        
        let alert:UIAlertController = UIAlertController(title: "what do you want to buy from:?", message: rawData, preferredStyle: UIAlertController.Style.alert)
    
        // button
        
       var okAction:UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)

        alert.addAction(okAction)
        
        var deleteAction:UIAlertAction = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler:nil)
        
        alert.addAction(deleteAction)
        present(alert, animated: true)
        
}

}
