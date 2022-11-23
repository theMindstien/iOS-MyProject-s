//
//  ViewController.swift
//  tabelViewDemo1
//
//  Created by apple on 21/09/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
{
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var instituteDataTableView: UITableView!
    
    
    
    var studentArray:[String] = ["SAURABH","ANEESH","ANKIT","RAVI"]
    var courseArray:[String] = ["BTech","MTech","BArch","Bio-Tech","MBA"]
    var countryArray:[String] = ["Indian","other"]
    
    override func viewDidLoad() {
        
        instituteDataTableView.sectionIndexColor = .red
        instituteDataTableView.sectionIndexBackgroundColor = .green
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        instituteDataTableView.dataSource = self
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section==0){
            return studentArray.count
        }
        if (section==1){
            return courseArray.count
        }
        if (section==2){
            return countryArray.count
        }
         return 0
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // let name = nameField!.text!
        
         let cell:UITableViewCell = UITableViewCell()
        if(indexPath.section == 0){
            let name = studentArray[indexPath.row]
            
             cell.textLabel?.text = " \(name)"
            
            
        }
        if(indexPath.section == 1){
            let name = courseArray[indexPath.row]
            cell.textLabel?.text =  " \(name)"
        }
        
        if(indexPath.section == 2){
            let name = countryArray[indexPath.row]
            cell.textLabel?.text =  " \(name)"
    }
            
        return cell
            
}
    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "*STUDENT NAME"
        }
        if(section == 1){
            return "*COURSE NAME"
        }
        if(section == 2){
            return "*COUNTRY"
        }else {
            return ""
        }
    }

    
    @IBAction func actionAdd(_ sender: Any) {
        let name = nameField!.text!
        if(name.count > 0){
            studentArray.append(name)
            instituteDataTableView.reloadData()
            nameField!.text = ""
        }
    }
    
}
