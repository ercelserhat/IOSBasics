//
//  FilmHucreCollectionViewCell.swift
//  MovieApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit

protocol FilmHucreCollectionViewCellProtocol{
    func sepeteEkle(indexPath: IndexPath)
}

class FilmHucreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelFilmFiyati: UILabel!
    @IBOutlet weak var labelFilmAdi: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    
    var hucreProtocol: FilmHucreCollectionViewCellProtocol?
    var indexPath: IndexPath?
    
    @IBAction func sepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
    }
}
