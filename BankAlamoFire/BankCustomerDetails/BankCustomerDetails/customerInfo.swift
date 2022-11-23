//
//  customerInfo.swift
//  BankCustomerDetails
//
//  Created by apple on 11/11/22.
//

import Foundation
class customerInfo:Encodable
{
    var id:Int = 0
    var name:String = ""
    var gender:String = ""
    var account_no:Int = 0
    var balance:Int = 0
    var accounttype:String = ""
    var pub_date:String = ""
    var email:String = ""
    var password:String = ""
 
    
    init(id:Int,name:String,gender:String,accounttype:String,account_no:Int,email:String,balance:Int,pub_date:String,password:String){
    self.id = id
    self.name = name
    self.gender = gender
    self.accounttype = accounttype
    self.account_no = account_no
    self.email = email
    self.balance = balance
    self.pub_date = pub_date
    self.password = password
}
}
