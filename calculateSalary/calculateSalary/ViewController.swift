//
//  ViewController.swift
//  calculateSalary
//
//  Created by apple on 10/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label1:UILabel?
    @IBOutlet var label2:UILabel?
    @IBOutlet var label3:UILabel?
    @IBOutlet var labelResult:UILabel?
    @IBOutlet var field1:UITextField?
    @IBOutlet var field2:UITextField?
    @IBOutlet var field3:UITextField?
    @IBOutlet var button1:UIButton?
    @IBOutlet var button2:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateSalary()->Void{
        var bs:Float = 0
        var ta:Float = 0
        var da:Float = 0
        var salary:Float = 0
        
        bs = Float(field1!.text!)!
        ta = Float(field2!.text!)!
        da = Float(field3!.text!)!
        salary = bs+ta+da
        labelResult!.text = "Salary = \(salary)"
        
    }
    @IBAction func reset(){
        field1!.text = "0"
        field2!.text = "0"
        field3!.text = "0"
        labelResult!.text = "0"
    }
    

}

