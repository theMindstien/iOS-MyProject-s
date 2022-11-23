//
//  ViewController.swift
//  AutolayoutDemo4
//
//  Created by apple on 17/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // usernameField.backgroundColor = .systemBrown
        let placeholderText = NSAttributedString(string:"username",attributes:[NSAttributedString.Key.foregroundColor:UIColor.white])
        usernameField.attributedPlaceholder = placeholderText
        let placeholderText1 = NSAttributedString(string:"password",attributes:[NSAttributedString.Key.foregroundColor:UIColor.white])
      passwordField.attributedPlaceholder = placeholderText1
    }
    override func viewDidAppear(_ animated: Bool)
    {
        makeRounded(view: imageView, radius: 20)
        makeRounded(view: usernameField, radius: 10)
        makeRounded(view: passwordField, radius: 10)
        makeRounded(view: loginButton, radius: 10)
        makeRounded(view: createButton, radius: 10)
        
    }
    func makeRounded(view:UIView, radius:Int)
    {
        view.layer.cornerRadius = CGFloat(radius)
       }
       
    @IBAction func onActionLogin(_ sender: Any) {
        let secondScreenCon:SecondViewController = storyboard!.instantiateViewController(withIdentifier: "screen2")as!SecondViewController
        present(secondScreenCon
                ,animated: true)
    }
    
}


