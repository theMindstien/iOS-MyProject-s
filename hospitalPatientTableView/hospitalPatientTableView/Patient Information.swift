//
//  Patient Information.swift
//  hospitalPatientTableView
//
//  Created by apple on 26/09/22.
//

import Foundation
class hospitalPatient{
    var patientName = ""
    var age:Int = 0
    var city = ""
    var doctorsName = ""
    var date = ""
    var gender = ""
    
    
    init(){}
    init(patientName:String,age:Int,city:String,doctorsName:String,date:String,gender:String){
        self.patientName = patientName
        self.age = age
        self.city = city
        self.doctorsName = doctorsName
        self.date = date
        self.gender = gender
        
    }
}
