//
//  Kelimeler.swift
//  DictionaryApp
//
//  Created by Serhat on 19.07.2023.
//

import Foundation

class Kelimeler: Codable{
    var kelime_id: String?
    var ingilizce: String?
    var turkce: String?
    
    init(kelime_id: String, ingilizce: String, turkce: String) {
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
}
