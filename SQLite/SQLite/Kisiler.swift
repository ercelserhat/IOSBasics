//
//  Kisiler.swift
//  SQLite
//
//  Created by Serhat on 14.07.2023.
//

import Foundation

class Kisiler{
    var kisi_id: Int
    var kisi_ad: String
    var kisi_yas: Int
    
    init(kisi_id: Int, kisi_ad: String, kisi_yas: Int) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_yas = kisi_yas
    }
}
