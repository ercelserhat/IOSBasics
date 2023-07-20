//
//  Filmler.swift
//  MovieApp
//
//  Created by Serhat on 20.07.2023.
//

import Foundation

class Filmler{
    var film_id: Int
    var film_adi: String
    var film_yili: Int
    var film_resmi: String
    var kategori: Kategoriler?
    var yonetmen: Yonetmenler?
    
    init(film_id: Int, film_adi: String, film_yili: Int, film_resmi: String, kategori: Kategoriler, yonetmen: Yonetmenler) {
        self.film_id = film_id
        self.film_adi = film_adi
        self.film_yili = film_yili
        self.film_resmi = film_resmi
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}
