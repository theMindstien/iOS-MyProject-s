//
//  ViewController.swift
//  Find Square & Cube
//
//  Created by apple on 09/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet   var label1:UILabel?
    @IBOutlet   var label2:UILabel?
    @IBOutlet  var field1:UITextField?
    @IBOutlet   var button1:UIButton?
    @IBOutlet  var button2:UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func findSquare()-> Void{
        var n:Float = 0
        var sqr:Float = 0
        
        n = Float(field1!.text!)!
        sqr = n*n
        label2!.text! = "Result = \(sqr)"
    }
        @IBAction func findCube()-> Void{
            var n:Float = 0
            var cube:Float = 0
            
            n = Float(field1!.text!)!
            cube = n*n*n
            label2!.text! = "Result = \(cube)"
        }
    @IBAction func reset(){
        field1!.text = "0"
        label2!.text = "0"
    }
    }
    



