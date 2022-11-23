//
//  ViewController.swift
//  DynamicUiDemo1
//
//  Created by apple on 21/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameViewlist: UIView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var hieghtConstraint:
    NSLayoutConstraint!
    
    var namex = 10
    var namey = 10
    
    var buttonx = 270
    var buttony = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionShow(_ sender: Any) {
        let name = nameField!.text!
        
        let labelFrame:CGRect = CGRect(x: namex, y: namey, width: 200, height: 40)
        namey = namey + 50
        
       let nameLabel:UILabel = UILabel(frame: labelFrame)
        nameLabel.text = name
        nameLabel.backgroundColor = UIColor.cyan
        self.nameViewlist.addSubview(nameLabel)
        
        if(namey<Int(self.nameViewlist.frame.height)){
            hieghtConstraint.constant = CGFloat(namey)
            
        // code for remove button:
            let butoonFrame:CGRect = CGRect(x: buttonx, y: buttony, width: 80, height: 40)
            buttony = buttony + 50
            
            let button:UIButton = UIButton(frame: butoonFrame)
            button.backgroundColor = .black
            button.setTitle("Remove", for: button.state)
            self.nameViewlist.addSubview(button)
            
            
        }
        
    }
    
}

