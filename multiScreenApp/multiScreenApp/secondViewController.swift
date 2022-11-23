//
//  secondViewController.swift
//  multiScreenApp
//
//  Created by apple on 14/09/22.
//
import Foundation
import UIKit

class secondViewController : UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var name:String = ""
    var age:Int = 0  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel!.text = name
        ageLabel!.text =  String(age)
       print("Second Screen")
        
    }
    // optional func
    
    override func viewDidAppear(_ animated: Bool) {
        print("second screen appear")
         }
    

    @IBAction func actionVoter(_ sender: Any) {
        if(age >= 18){
            resultLabel!.text = "Can Vote"
        }else{
            resultLabel!.text = "Can Not Vote"
        }
        
    }
    

    @IBAction func actionBack(_ sender: Any) {
        
        dismiss(animated:true)
}
}
