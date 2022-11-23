//
//  ViewController.swift
//  SwipeGestureInApp
//
//  Created by apple on 07/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var directionLabel: UILabel!
    var imageArray:[String] = ["blackdog","catcrop","fox","husky","image","monkey","parrot","pinkdog","squirrel"]
    
    var position = 0
    
    
    
    override func viewDidLoad() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handLeftSwipe(gesture:)))
        let swipeRight = UISwipeGestureRecognizer()
        let swipeUp = UISwipeGestureRecognizer()
        let swipeDown = UISwipeGestureRecognizer()

        swipeRight.direction = .right
        swipeUp.direction = .up
        swipeDown.direction = .down
       //  for left swipe
        swipeGesture.direction = UISwipeGestureRecognizer.Direction.left
        
        
        dogImageView.layer.cornerRadius = 20
        
        // self.view used instead of imageviewname to apply gesture on anywhere in view
        self.view.addGestureRecognizer(swipeGesture)
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(swipeDown)
        self.view.isUserInteractionEnabled = true
        self.view.isMultipleTouchEnabled = false
        
        swipeUp.addTarget(self, action: #selector(swipe(sender:)))

        swipeDown.addTarget(self, action: #selector(swipe(sender:)))
        swipeRight.addTarget(self, action: #selector(swipe(sender:)))
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @objc func handLeftSwipe(gesture:UITapGestureRecognizer) ->Void
    {
        
      position = position+1
      
        if position==imageArray.count
        {
            position = 0
        }
        dogImageView.image = UIImage(named: imageArray[position])
    }
    @objc func swipe(sender:UISwipeGestureRecognizer)
    {
       
        switch sender.direction {
        case .up:
            directionLabel.text = "Swipe UP"
            
              position = position - 1
//            if position==imageArray.count
//            {
//                position = 0
//                position = position - 1
//            }
               
            dogImageView.image = UIImage(named: imageArray[position])

        case .down:
            directionLabel.text = "Swipe Down"
             
              position = position + 1
//            if position==imageArray.count
//            {
//                position = 0
//                position = position + 1
//            }
            dogImageView.image = UIImage(named: imageArray[position])

        case .right:
            directionLabel.text = "Swipe Right"
           
             position =  position - 1
            
//            if(position == imageArray.count){
//                position = 0
                
       
            dogImageView.image = UIImage(named: imageArray[position])

        default:
            directionLabel.text = ""


        }

//        if position==imageArray.count
//        {
//            position = 0
//        }
//        dogImageView.image = UIImage(named: imageArray[position])

    }
}

