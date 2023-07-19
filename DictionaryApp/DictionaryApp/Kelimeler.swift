//
//  Kelimeler.swift
//  DictionaryApp
//
//  Created by Serhat on 19.07.2023.
//

import Foundation

class Kelimeler{
    var kelime_id: Int?
    var ingilizce: String?
    var turkce: String?
    
    init(kelime_id: Int, ingilizce: String, turkce: String) {
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
}
