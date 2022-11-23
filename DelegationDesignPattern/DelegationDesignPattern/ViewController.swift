//
//  ViewController.swift
//  DelegationDesignPattern
//
//  Created by apple on 30/09/22.
//

import UIKit
                                        // inherit protocol
class ViewController: UIViewController,dateViewControllerDelegate
{
    
    
    @IBOutlet weak var dobTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionOpenCalender(_ sender: Any) {
        let dateChooseCon:DateViewController = self.storyboard!.instantiateViewController(withIdentifier: "DateViewController") as! DateViewController
        
        dateChooseCon.delegate = self
        present(dateChooseCon, animated: true)
    }
    
    // compulsory function of protocol
    func onDateSelected(selectedDate: Date?) {
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let showDate = formatter.string(from: selectedDate!)
        dobTextField!.text = showDate
    }
    
}

