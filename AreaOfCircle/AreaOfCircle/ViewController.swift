//
//  ViewController.swift
//  AreaOfCircle
//
//  Created by apple on 09/09/22.
//
   import UIKit

    class ViewController: UIViewController {
        @IBOutlet  var label1:UILabel?
        @IBOutlet  var label2:UILabel?
        
        @IBOutlet  var field1:UITextField?
        
        @IBOutlet  var button1:UIButton?
        

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        @IBAction func findArea()->Void{
            var rad:Float = 0
            
            var area:Float = 0
            
           rad = Float(field1!.text!)!
            
            area = 3.14*(rad*rad)
            label2!.text! = "Area = \(area)"
        }
        @IBAction func findCircumference()->Void{
            var rad:Float = 0
            
            var circumference:Float = 0
            
            rad = Float(field1!.text!)!
            
            circumference = 2*(3.14*rad)
            label2!.text! = "circumference = \(circumference)"
    }

    }




