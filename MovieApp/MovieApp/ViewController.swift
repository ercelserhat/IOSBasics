//
//  ViewController.swift
//  MovieApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kategoriTableView: UITableView!
    
    var kategorilerListe = [Kategoriler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        
        kategoriTableView.delegate = self
        kategoriTableView.dataSource = self
        
        kategorilerListe = Kategorilerdao().tumKategorileriAl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! FilmViewController
        gidilecekVC.kategori = kategorilerListe[indeks!]
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten mevcut.")
        }else{
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {
                print(error.localizedDescription)
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
