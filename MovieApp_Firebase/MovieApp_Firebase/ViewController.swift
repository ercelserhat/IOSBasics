//
//  ViewController.swift
//  MovieApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var kategoriTableView: UITableView!
    
    var kategorilerListe = [Kategoriler]()
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kategoriTableView.delegate = self
        kategoriTableView.dataSource = self
        
        ref = Database.database().reference()
        tumKategorileriAl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! FilmViewController
        gidilecekVC.kategori = kategorilerListe[indeks!]
    }
    
    func tumKategorileriAl(){
        ref.child("kategoriler").observe(.value, with: {snapshot in
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject]{
                self.kategorilerListe.removeAll()
                for gelenSatirVerisi in gelenVeriButunu{
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        let kategori_ad = sozluk["kategori_ad"] as? String ?? ""
                        
                        let kategori = Kategoriler(kategori_id: key, kategori_ad: kategori_ad)
                        self.kategorilerListe.append(kategori)
                    }
                }
            }
            DispatchQueue.main.async {
                self.kategoriTableView.reloadData()
            }
        })
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
