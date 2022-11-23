//
//  DateViewController.swift
//  DelegationDesignPattern
//
//  Created by apple on 30/09/22.
//
// delegate
import UIKit
// protocol wtih specified method

protocol dateViewControllerDelegate{
    func onDateSelected(selectedDate:Date?)
    
    }





class DateViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate:dateViewControllerDelegate?        // delegate--is reference of protocol which will be used in view controller to fetch data from here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.backgroundColor = .cyan
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionDone(_ sender: Any) {
        
        let date = datePicker.date
        delegate!.onDateSelected(selectedDate: date)     //delegate will hold                                                   selected date by user
        
        
        
        dismiss(animated: true)
    }
    
   

}
