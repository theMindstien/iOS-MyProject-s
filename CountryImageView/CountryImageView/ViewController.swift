//
//  ViewController.swift
//  CountryImageView
//
//  Created by apple on 12/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var flagImageView:UIImageView?
    @IBOutlet var segments:UISegmentedControl?
    @IBOutlet var switchShowHide:UISwitch?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     @IBAction func onSwitchChange(){
            print("switch change",switchShowHide!.isOn)
         
         if(switchShowHide!.isOn == true)
         {
             flagImageView!.isHidden = false
         }else{
             flagImageView!.isHidden = true
            
         }
        }
 
    @IBAction func onSegmentChange(){
        print("segment",segments!.selectedSegmentIndex)
        switch(segments!.selectedSegmentIndex){
        case 0:
            flagImageView!.image = UIImage(named: "modi.jpeg")
        case 1:
            flagImageView!.image = UIImage(named: "bhutanking.jpeg")
        case 2:
            flagImageView!.image = UIImage(named: "usapresident.jpeg")
        case 3:
            flagImageView!.image = UIImage(named: "zingping.jpeg")
        
        default:
            print("enter valid choice")
        }
    }

}

