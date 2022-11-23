//
//  ViewController.swift
//  checkEvenOdd
//
//  Created by apple on 10/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label1:UILabel?
    @IBOutlet var labelResult:UILabel?
    @IBOutlet var field1:UITextField?
    @IBOutlet var button1:UIButton?
    @IBOutlet var button2:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func checkEvenOdd(){
        var num:Int = Int(field1!.text!)!
        if(num%2 == 0){
            labelResult!.text! = "\(num) is Even Number"
        }else{
            labelResult!.text! = "\(num) is Odd Number"
        }
}
    @IBAction func reset(){
        field1!.text = "0"
        labelResult!.text = "0"
    }
}
