//
//  ViewController.swift
//  SimpleInterest
//
//  Created by apple on 09/09/22.
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculate(){
        var p:Float = 0
        var r:Float = 0
        var t:Float = 0
        var calculate:Float = 0
        
        p = Float(field1!.text!)!
        r = Float(field2!.text!)!
        t = Float(field3!.text!)!
        
        calculate = (p*r*t)/100
        
        labelResult!.text! = "S.I = \(calculate)"
    }
        @IBAction func reset(){
            field1!.text = "0"
            field2!.text = "0"
            field3!.text = "0"
            labelResult!.text = "0"
        }
    }



