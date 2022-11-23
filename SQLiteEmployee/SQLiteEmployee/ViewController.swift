//
//  ViewController.swift
//  SQLiteEmployee
//
//  Created by apple on 19/10/22.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    @IBOutlet weak var employeTableView: UITableView!
    
    var empData:[[Int:String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let q = "select * from employee"
        
        empData = SQLiteWrapper.executeSelectQuery(query: q)
        print(empData)
        
       employeTableView.reloadData()    }


}

