//
//  NewViewController.swift
//  pinchGesture
//
//  Created by apple on 08/10/22.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pinchAction(_ sender: Any) {
        guard let gestureView = pinchGesture.view else{
            return
        }
        
        gestureView.transform = gestureView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1
        
    }
    
    

}
