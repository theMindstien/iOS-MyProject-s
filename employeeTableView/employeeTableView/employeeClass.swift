//
//  employeeClass.swift
//  employeeTableView
//
//  Created by apple on 26/09/22.
//

import Foundation
class employee{
    var empid:Int = 0
    var empName = ""
    var salary:Float = 0
    var depart = ""
    var joinDate = ""
    
    init(){}
    init(empid:Int,empName:String,salary:Float,depart:String,joinDate:String){
        
        self.empid = empid
        self.empName = empName
        self.salary = salary
        self.depart = depart
        self.joinDate = joinDate
    }
}
