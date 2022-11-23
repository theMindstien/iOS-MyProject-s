//
//  ViewController.swift
//  FindAreaofRectangle
//
//  Created by apple on 09/09/22.
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
    }
    @IBAction func findArea()->Void{
        var len:Float = 0
        var wid:Float = 0
        var area:Float = 0
        
        len = Float(field1!.text!)!
        wid = Float(field2!.text!)!
        area = len * wid
        label3!.text! = "Area = \(area)"
    }
    @IBAction func findPerimeter()->Void{
        var len:Float = 0
        var wid:Float = 0
        var perimeter:Float = 0
        
        len = Float(field1!.text!)!
        wid = Float(field2!.text!)!
        perimeter = 2 * (len + wid)
        label3!.text! = "Perimeter = \(perimeter)"
}

}
