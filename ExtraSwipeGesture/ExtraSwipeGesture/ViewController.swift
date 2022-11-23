//
//  ViewController.swift
//  ExtraSwipeGesture
//
//  Created by apple on 07/10/22.
//

import UIKit

class ViewController: UIViewController {
    var imageArray:[String] = ["blackdog","catcrop","fox","husky","image","monkey","parrot","pinkdog","squirrel"]
    
    var position = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
        case .left:
            print("left")
            position = position-1
            imageView.image = UIImage(named: imageArray[position])
        case .up:
            //directionLabel.text = "Swipe UP"
            print("up")
            position = position+1
            imageView.image = UIImage(named: imageArray[position])
//            if position==imageArray.count
//            {
//                position = 0
//                position = position - 1
//            }
    

        case .down:
           // directionLabel.text = "Swipe Down"
            print("down")
            position = position-1
            imageView.image = UIImage(named: imageArray[position])
//            if position==imageArray.count
//            {
//                position = 0
//                position = position + 1
//            }
         

        case .right:
          //  directionLabel.text = "Swipe Right"
            print("right")
            
            position = position+1
            imageView.image = UIImage(named: imageArray[position])
//            if(position == imageArray.count){
//                position = 0
                
       
          

        default:
            print("enter valid choice")
          //  directionLabel.text = ""


        }

//        if position==imageArray.count
//        {
//            position = 0
//        }
//        dogImageView.image = UIImage(named: imageArray[position])

    }
    }
    

