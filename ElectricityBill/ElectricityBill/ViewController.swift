//
//  ViewController.swift
//  ElectricityBill
//
//  Created by apple on 10/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label1:UILabel?
    @IBOutlet var label2:UILabel?
    @IBOutlet var labelResult:UILabel?
    @IBOutlet var field1:UITextField?
    @IBOutlet var field2:UITextField?
    @IBOutlet var button1:UIButton?
    @IBOutlet var button2:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func calculateBill(){
        
        var unit1:Float = Float(field1!.text!)!
        var unit2:Float = Float(field2!.text!)!
        let totalUnit:Float = unit1 + unit2
        var totalBill:Float = 0
        
        if(totalUnit>0 && totalUnit<150){
           totalBill = totalUnit*4
        
        }else if (totalUnit>151 && totalUnit<300){
            totalBill = totalUnit*6
        }else if
        
        (totalUnit>300 && totalUnit<500){
           totalBill = totalUnit*4
        }else if
            (totalUnit>500){
               totalBill = totalUnit*10
        }
        labelResult!.text! = String(totalBill)

}
    @IBAction func reset(){
        field1!.text = "0.0"
        field2!.text = "0.0"
        labelResult!.text = "0.0"
    }
    }

