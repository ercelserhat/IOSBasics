//
//  ViewController.swift
//  MovieApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var kategoriTableView: UITableView!
    
    var kategorilerListe = [Kategoriler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kategoriTableView.delegate = self
        kategoriTableView.dataSource = self
        
        tumKategorileriGetir()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! FilmViewController
        gidilecekVC.kategori = kategorilerListe[indeks!]
    }
    
    func tumKategorileriGetir(){
        AF.request("http://kasimadalan.pe.hu/filmler/tum_kategoriler.php", method: .get).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KategoriCevap.self, from: data)
                    if let gelenKategoriListesi = cevap.kategoriler{
                        self.kategorilerListe = gelenKategoriListesi
                    }
                    DispatchQueue.main.async {
                        self.kategoriTableView.reloadData()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategorilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kategori = kategorilerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre") as! KategoriHucreTableViewCell
        cell.labelKategoriAdi.text = kategori.kategori_ad
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toFilm", sender: indexPath.row)
    }
}
