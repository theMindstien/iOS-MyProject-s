//
//  SecondViewController.swift
//  fruitListTableView
//
//  Created by apple on 23/09/22.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var fruitNameField: UITextField!
    
    var fruitViewCon:ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    @IBAction func actioAdd(_ sender: Any) {
        let name = fruitNameField!.text!
         if(name.count > 0){
             fruitViewCon!.fruitArray.append(name)
             fruitViewCon!.fruitTableView.reloadData()
             fruitNameField!.text = ""
             
             
         }
        
        dismiss (animated:true)

    }
}
