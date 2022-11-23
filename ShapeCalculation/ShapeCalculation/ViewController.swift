//
//  ViewController.swift
//  ShapeCalculation
//
//  Created by apple on 13/09/22.
//
//[QUE: App should allow to Select shape type from segmented control. if selected shape is circle then ask user to enter radius, if selected shape is square then ask user to enter side if selected shape is rectangle then ask user to enter length and breadth.  Find Area button should work according to selected shape.]


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shapeImageView: UIImageView!
    @IBOutlet weak var shapeSegment: UISegmentedControl!
    
    @IBOutlet weak var sideTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var radiusTextField: UITextField!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var rectangleLabel: UILabel!
    @IBOutlet weak var squareLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func onSegmentChange(_ sender: Any) {
        
        switch( shapeSegment!.selectedSegmentIndex)
        {
        case 0:
            shapeImageView!.image = UIImage(named: "square.png")
            squareLabel!.isHidden = false
            sideTextField.isHidden = false
            circleLabel!.isHidden = true
            rectangleLabel.isHidden = true
            lengthTextField.isHidden = true
            widthTextField.isHidden = true
            radiusTextField.isHidden = true
        case 1:
            shapeImageView!.image = UIImage(named: "rectangle.png")
            rectangleLabel.isHidden = false
            lengthTextField.isHidden = false
            widthTextField.isHidden = false
            circleLabel!.isHidden = true
            squareLabel!.isHidden = true
            sideTextField.isHidden = true
            radiusTextField.isHidden = true
        case 2:
            shapeImageView!.image = UIImage(named: "circle.png")
            circleLabel!.isHidden = false
            radiusTextField.isHidden = false
            squareLabel!.isHidden = true
            sideTextField.isHidden = true
            rectangleLabel.isHidden = true
            lengthTextField.isHidden = true
            widthTextField.isHidden = true
            
            
        default:
            print("Not a valid Selectiion")
            
        }
        
        
    }
    
    
    @IBAction func findArea(_ sender: Any) {
        let area:Float = 0
        let side:String = sideTextField!.text!
        let s1 = Float(side)
        let length = lengthTextField!.text!
        let l1 = Float(length)
        let width = widthTextField!.text!
        let w1 = Float(width)
        let radius = radiusTextField!.text!
        let r1 = Float(radius)
    if(shapeSegment.selectedSegmentIndex == 0){
        var area = s1!*s1!
        
        resultLabel!.text = "\(area)"
        
    }else if(shapeSegment.selectedSegmentIndex == 1){
            var area = l1!*w1!
        
        resultLabel!.text = "\(area)"
        
        }else if(shapeSegment.selectedSegmentIndex == 2){
            var area = 3.14*r1!*r1!
            
            resultLabel!.text = "\(area)"
    }
    }
}

