//
//  ViewController.swift
//  BiggestDigit
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
    @IBAction func check()->Void{
        var firstno:Float = Float(field1!.text!)!
        var secondno:Float = Float(field2!.text!)!
        var thrdno:Float = Float(field3!.text!)!
        
        if(firstno>secondno && firstno>thrdno){
            labelResult!.text! = "\(firstno) is biggest number"
            
        }else if(secondno>firstno && secondno>thrdno){
            labelResult!.text! = "\(secondno) is biggest number"
            
        }else if(thrdno>secondno && thrdno>firstno){
            labelResult!.text! = "\(thrdno) is biggest number"
            
        }
    }
    
    @IBAction func reset(){
        field1!.text = "0"
        field2!.text = "0"
        field3!.text = "0"
        labelResult!.text = ""
    }

}

