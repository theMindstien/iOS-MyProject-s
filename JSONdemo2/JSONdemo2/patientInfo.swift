//
//  patientInfo.swift
//  JSONdemo2
//
//  Created by apple on 04/11/22.
//

import Foundation
class patientInfo{
    var id:Int = 0
    var name:String = ""
    var age:Int = 0
    var gender:String = ""
    
    init(id:Int,name:String,age:Int,gender:String){
        
        self.id = id
        self.name = name
        self.age = age
        self.gender = gender
        
    }
    
}
