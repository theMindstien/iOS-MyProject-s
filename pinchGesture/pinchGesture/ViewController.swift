//
//  ViewController.swift
//  pinchGesture
//
//  Created by apple on 08/10/22.
//

import UIKit

class ViewController: UIViewController
{
    let imageView = UIImageView()
    let pinchGesture = UIPinchGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.image = UIImage(named: "monkey")
        imageView.isUserInteractionEnabled = true
        imageView.isMultipleTouchEnabled = true
        self.view.addSubview(imageView)
        
        imageView.center = view.center
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.layer.cornerRadius = 20
        
        imageView.addGestureRecognizer(pinchGesture)
        pinchGesture.addTarget(self, action: #selector(pinchAction))
    }

    @objc func pinchAction(){
        guard let gestureView = pinchGesture.view else{
            return
        }
        gestureView.transform =  gestureView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1
        
      
        
        
        
        
    }
}

