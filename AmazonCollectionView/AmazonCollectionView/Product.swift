//
//  Product.swift
//  AmazonCollectionView
//
//  Created by apple on 03/10/22.
//

import Foundation
class productInfo
{
    var idNo = ""
    var name = ""
    var image = ""
    var price:Float = 0
    init(){}
    init(idNo:String,name:String,image:String,price:Float){
        self.idNo =  idNo
        self.name = name
        self.image = image
        self.price = price
        
    }
    
}
