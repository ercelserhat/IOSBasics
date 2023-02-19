//
//  Kisiler.swift
//  TableView - Custom Cell
//
//  Created by Serhat on 19.02.2023.
//

import Foundation

class Kisiler{
    var kisiId:Int?
    var kisiAdi:String?
    var kisiTel:String?
    
    init(){
        
    }
    
    init(kisiId:Int, kisiAdi:String, kisiTel:String){
        self.kisiId = kisiId
        self.kisiAdi = kisiAdi
        self.kisiTel = kisiTel
    }
}
