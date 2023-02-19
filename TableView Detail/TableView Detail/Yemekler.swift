//
//  Yemekler.swift
//  TableView Detail
//
//  Created by Serhat on 19.02.2023.
//

import Foundation

class Yemekler{
    var yemekId:Int?
    var yemekAdi:String?
    var yemekResimAdi:String?
    var yemekFiyat:Double?
    
    init(){
        
    }
    
    init(yemekId: Int? = nil, yemekAdi: String? = nil, yemekResimAdi: String? = nil, yemekFiyat: Double? = nil) {
        self.yemekId = yemekId
        self.yemekAdi = yemekAdi
        self.yemekResimAdi = yemekResimAdi
        self.yemekFiyat = yemekFiyat
    }
}
