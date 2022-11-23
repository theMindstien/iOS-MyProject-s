//
//  ViewController.swift
//  bankTableView
//
//  Created by apple on 24/09/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource
{

    @IBOutlet var accountTableView:UITableView?
    var bankArray:[BankAccount]=[]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let u1 = BankAccount(bankAccNo: 202114, name: "Saurabh", balance: 5000000)
        let u2 = BankAccount(bankAccNo: 202122, name: "Sachin", balance: 100000)
        let u3 = BankAccount(bankAccNo: 2022006, name: "Gautam", balance: 25000)
        
        bankArray.append(u1)
        bankArray.append(u2)
        bankArray.append(u3)
        
        accountTableView?.dataSource = self
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==0){
            return bankArray.count
        }
        return 0
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        
        let accObject:BankAccount = bankArray[indexPath.row]
        
        cell.textLabel!.text = "AccNo:\(accObject.bankAccNo)"
        cell.detailTextLabel!.text = "Name:\(accObject.name),Balance:\(accObject.balance)"
        cell.imageView?.image = UIImage(named: "image")
        cell.backgroundColor = .cyan
        return cell
    
    }
    
  
    @IBAction func actionNext(_ sender: Any) {
    
        let secondViewCon:NewViewController = storyboard!.instantiateViewController(withIdentifier: "screen2") as! NewViewController
        
        secondViewCon.bankViewCon = self
        present(secondViewCon,animated: true)
        
}
}

