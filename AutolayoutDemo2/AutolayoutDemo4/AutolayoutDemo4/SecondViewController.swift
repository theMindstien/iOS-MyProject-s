//
//  SecondViewController.swift
//  AutolayoutDemo4
//
//  Created by apple on 19/09/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var firstUiView: UIView!
    @IBOutlet weak var secondUiView: UIView!
    @IBOutlet weak var fromImageView: UIView!
    @IBOutlet weak var toImageView: UIView!
    @IBOutlet weak var upDownImageView: UIView!
    @IBOutlet weak var passangerImageView: UIImageView!
    @IBOutlet weak var departImageView: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        makeRounded(view: fromImageView, radius: 20)
        makeRounded(view: toImageView, radius: 20)
        makeRounded(view: upDownImageView, radius: 10)
        makeRounded(view: passangerImageView, radius: 35)
        makeRounded(view: departImageView, radius: 35)
        makeRounded(view: searchButton, radius: 30)
        makeRounded(view: firstUiView, radius: 30)
        makeRounded(view: secondUiView, radius: 30)
        
        
    }
    func makeRounded(view:UIView, radius:Int)
    {
        view.layer.cornerRadius = CGFloat(radius)
       }

   

}
