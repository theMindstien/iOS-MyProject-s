//
//  ViewController.swift
//  wildAnimalSegmentUsing switchCase
//
//  Created by apple on 10/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageview:UIImageView?
    @IBOutlet var segment:UISegmentedControl?
    @IBOutlet var showHide:UISwitch?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onSwitchChange(){
        if(showHide!.isOn == true){
            imageview!.isHidden = false
        }else{
            imageview!.isHidden = true
        }
    }
    @IBAction func onSegmentChange(){
        switch(segment!.selectedSegmentIndex)
        {
        case 0:
            imageview!.image = UIImage(named: "download (4).jpeg")
        case 1:
            imageview!.image = UIImage(named: "monkey.jpeg")
        case 2:
            imageview!.image = UIImage(named: "images (1).jpeg")
        case 3:
            imageview!.image = UIImage(named: "download (3).jpeg")
        default:
            print("Enter Valid Choice")
        }
        
    }

}

