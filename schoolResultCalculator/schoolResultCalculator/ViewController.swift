//
//  ViewController.swift
//  schoolResultCalculator
//
//  Created by apple on 10/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label1:UILabel?
    @IBOutlet var label2:UILabel?
    @IBOutlet var label3:UILabel?
    @IBOutlet var label4:UILabel?
    @IBOutlet var label5:UILabel?
    @IBOutlet var labelmarks:UILabel?
    @IBOutlet var labelpercentage:UILabel?
    @IBOutlet var labelgrade:UILabel?
    @IBOutlet var field1:UITextField?
    @IBOutlet var field2:UITextField?
    @IBOutlet var field3:UITextField?
    @IBOutlet var field4:UITextField?
    @IBOutlet var field5:UITextField?
    @IBOutlet var button1:UIButton?
    @IBOutlet var button2:UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculate(){
        var hindi:Float = Float(field1!.text!)!
        var english:Float = Float(field2!.text!)!
        var sst:Float = Float(field3!.text!)!
        var maths:Float = Float(field4!.text!)!
        var science:Float = Float(field5!.text!)!
        
        var total:Float = hindi+english+sst+maths+science
        labelmarks!.text! = "Total marks = \(total)"
        
        var percentage:Float = (total/500)*100
        labelpercentage!.text! = "Total percentage = \(percentage)"
        
        switch(percentage)
        {
        case 68...100:
            labelgrade!.text! = "Pass:A grade"
        case 57...67:
            labelgrade!.text! = "Pass:B grade"
        case 46...56:
            labelgrade!.text! = "Pass C grade"
        case 33...45:
            labelgrade!.text! = "Pass:d grade"
        case 0...32:
            labelgrade!.text! = "FAIL"
        default:
            labelgrade!.text! = "prmoted to next class"
        }
    }
    
       @IBAction func reset(){
            field1!.text = "0"
            field2!.text = "0"
            field3!.text = "0"
            field4!.text = "0"
            field5!.text = "0"
            labelmarks!.text = "Total Marks = 0"
            labelpercentage!.text = "Percentage = 0"
           labelgrade!.text = "Grade = 0"
        }

    
}

