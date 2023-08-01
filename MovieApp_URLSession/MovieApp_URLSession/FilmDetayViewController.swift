//
//  FilmDetayViewController.swift
//  MovieApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit

class FilmDetayViewController: UIViewController {

    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFilmAdi: UILabel!
    @IBOutlet weak var labelFilmYili: UILabel!
    @IBOutlet weak var labelFilmKategorisi: UILabel!
    @IBOutlet weak var labelFilmYonetmeni: UILabel!
    
    var film: Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film{
            if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/\(f.film_resim)"){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.imageViewFilm.image = UIImage(data: data!)
                    }
                }
            }
            labelFilmAdi.text = f.film_ad
            labelFilmYili.text = f.film_yil
            labelFilmKategorisi.text = f.kategori?.kategori_ad
            labelFilmYonetmeni.text = f.yonetmen?.yonetmen_ad
        }
    }
}
