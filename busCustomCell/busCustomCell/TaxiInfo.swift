//
//  TaxiInfo.swift
//  busCustomCell
//
//  Created by apple on 29/09/22.
//

import Foundation
class TaxiInfo{
    var taxiNo:String = ""
    var source:String = ""
    var destination:String = ""
    var departTime:String = ""
    var reachTime:String = ""
    var taxiPhoto:String = ""
    var fare:String = ""
    
    init(taxiNo:String,source:String,destination:String,departTime:String,reachTime:String,fare:String,taxiPhoto:String){
        
        self.taxiNo = taxiNo
        self.source = source
        self.destination = destination
        self.departTime = departTime
        self.reachTime = reachTime
        self.fare = fare
        self.taxiPhoto = taxiPhoto
        
    }
}
