//
//  ViewController.swift
//  multiScreenApp
//
//  Created by apple on 14/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSubmit(_ sender: Any) {
        let n:String = nameField!.text!
        let a:Int = Int(ageField!.text!)!
        
        // 1st screen ->  object of 2nd screen and pass name and age
        
        let secondScreencon:secondViewController = storyboard!.instantiateViewController(withIdentifier: "screen2") as!secondViewController
        
        secondScreencon.name = n
        secondScreencon.age = a
        
        present(secondScreencon,animated: true)
        
    }
    
}

