//
//  ViewController.swift
//  TapGestureApp
//
//  Created by apple on 07/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickOfTapGesture(_ sender: Any) {
        print("Tap Gesture clicked ")
        view.backgroundColor = .red
    }
    
}

