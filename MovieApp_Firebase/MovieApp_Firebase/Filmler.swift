//
//  Filmler.swift
//  MovieApp
//
//  Created by Serhat on 20.07.2023.
//

import Foundation

class Filmler{
    var film_id: String
    var film_ad: String
    var film_yil: Int
    var film_resim: String
    var kategori_ad: String
    var yonetmen_ad: String
    
    init(film_id: String, film_ad: String, film_yil: Int, film_resim: String, kategori_ad: String, yonetmen_ad: String) {
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.film_resim = film_resim
        self.kategori_ad = kategori_ad
        self.yonetmen_ad = yonetmen_ad
    }
}
