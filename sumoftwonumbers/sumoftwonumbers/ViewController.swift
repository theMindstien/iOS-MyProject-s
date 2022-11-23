//
//  ViewController.swift
//  sumoftwonumbers
//
//  Created by apple on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    
  @IBOutlet  var label1:UILabel?
  @IBOutlet  var label2:UILabel?
  @IBOutlet  var label3:UILabel?
  @IBOutlet  var field1:UITextField?
  @IBOutlet  var field2:UITextField?
  @IBOutlet  var button1:UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("hello this is sum app")
    }
     @IBAction  func sum()->Void{
        var x:Float = 4
        var y:Float = 5
        var z:Float = 0
        
        x = Float(field1!.text!)!
        y = Float(field2!.text!)!
        z = x + y
        label3!.text! = "Result = \(z)"
        
        
        
    }

}

