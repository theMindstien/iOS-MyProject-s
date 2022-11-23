//
//  NewViewController.swift
//  bankTableView
//
//  Created by apple on 24/09/22.
//

import UIKit

class NewViewController: UIViewController
{
    @IBOutlet weak var accNoField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var balanceField: UITextField!
    
   var bankViewCon:ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        let acno:Int = Int(accNoField!.text!)!
        let Name = nameField!.text!
        let Bal:Float = Float(balanceField!.text!)!
        
        let accobj:BankAccount =  BankAccount(bankAccNo: acno, name: Name, balance: Bal)
      
        bankViewCon!.bankArray.append(accobj)
        bankViewCon!.accountTableView?.reloadData()
        accNoField!.text = ""
        nameField!.text = ""
        balanceField!.text = ""
        
        dismiss(animated: true)
        
        }
        
    }
    
    






















