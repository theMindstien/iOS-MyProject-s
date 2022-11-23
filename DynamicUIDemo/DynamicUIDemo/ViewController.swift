//
//  ViewController.swift
//  DynamicUIDemo
//
//  Created by apple on 20/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var nameListView: UIView!
    var basex:Int = 10
    var basey:Int = 10
    var xnew:Int = 270
    var ynew:Int = 10
    @IBOutlet weak var listHieghtConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
    
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSubmit(_ sender: Any) {
      let name = nameField!.text!
     // let age:Int = Int(ageField!.text!)!
        
        let labelFrame:CGRect = CGRect(x: basex, y: basey, width: 200, height: 40)
          basey = basey + 50
        
        let nameLabel:UILabel = UILabel(frame: labelFrame)
        nameLabel.text = name
        nameLabel.font = UIFont(name: "Times New Roman",
        size: 40)
        nameLabel.backgroundColor = UIColor.cyan
        self.nameListView.addSubview(nameLabel);
        
        if( basey < Int(self.nameListView.frame.height)){
            listHieghtConstraint.constant = CGFloat(basey)
          
        }
        let buttonFrame:CGRect = CGRect(x: xnew, y: ynew, width: 80, height: 40)
        ynew = ynew + 50
        let button:UIButton = UIButton(frame:buttonFrame)
        button.backgroundColor = UIColor.black
        button.setTitle("Remove", for: button.state)
        button.tintColor = UIColor.white
        self.nameListView.addSubview(button)
        button.addTarget(nameListView, action: #selector(buttonTapped), for: .touchUpInside)
       
        
        
}
    @objc func buttonTapped()
    {
        view.backgroundColor = UIColor.systemBrown
        nameField.text = ""
       
        
        
    }
}
