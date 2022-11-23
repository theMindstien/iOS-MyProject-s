//
//  ViewController.swift
//  LongPressGesture
//
//  Created by apple on 08/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressGesture = UILongPressGestureRecognizer()
        self.view.addGestureRecognizer(longPressGesture)
        longPressGesture.addTarget(self, action: #selector(clickLongPress))
    }
  @objc func clickLongPress()
    {
        print("long press gesture sucessfully tested")
        view.backgroundColor = .cyan
    }

}

