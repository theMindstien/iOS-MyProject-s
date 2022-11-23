//
//  BankAccount.swift
//  bankTableView
//
//  Created by apple on 24/09/22.
//

import Foundation
class BankAccount{
    var bankAccNo:Int = 0
    var name:String = ""
    var balance:Float = 0
    
    init(){}
    init(bankAccNo:Int,name:String,balance:Float){
        self.bankAccNo = bankAccNo
        self.name = name
        self.balance = balance
    }
}
