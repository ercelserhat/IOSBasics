//
//  ViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    var aramaYapiliyormu = false
    var aramaKelimesi: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        
        kisilerTableView.dataSource = self
        kisilerTableView.delegate = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if aramaYapiliyormu{
            kisilerListe = Kisilerdao().aramaYap(kisi_ad: aramaKelimesi!)
        }else{
            kisilerListe = Kisilerdao().tumKisileriAl()
        }
        kisilerTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        if segue.identifier == "toKisiDetay"{
            let gidilecekVC = segue.destination as! KisiDetayViewController
            gidilecekVC.kisi = kisilerListe[indeks!]
        }
        if segue.identifier == "toKisiGuncelle"{
            let gidilecekVC = segue.destination as! KisiGuncelleViewController
            gidilecekVC.kisi = kisilerListe[indeks!]
        }
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "kisiler", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("kisiler.sqlite")
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

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiHucre", for: indexPath) as! KisiHucreTableViewCell
        cell.kisiYaziLabel.text = "\(kisi.kisi_ad) - \(kisi.kisi_tel)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toKisiDetay", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualaction, view, boolValue in
            let kisi = self.kisilerListe[indexPath.row]
            Kisilerdao().kisiSil(kisi_id: kisi.kisi_id)
            if self.aramaYapiliyormu{
                self.kisilerListe = Kisilerdao().aramaYap(kisi_ad: self.aramaKelimesi!)
            }else{
                self.kisilerListe = Kisilerdao().tumKisileriAl()
            }
            self.kisilerTableView.reloadData()
        }
        let guncelleAction = UIContextualAction(style: .normal, title: "Güncelle") { contextualaction, view, boolValue in
            self.performSegue(withIdentifier: "toKisiGuncelle", sender: indexPath.row)
        }
        return UISwipeActionsConfiguration(actions: [silAction, guncelleAction])
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonuç: \(searchText)")
        aramaKelimesi = searchText
        if searchText == ""{
            aramaYapiliyormu = false
        }else{
            aramaYapiliyormu = true
        }
        kisilerListe = Kisilerdao().aramaYap(kisi_ad: aramaKelimesi!)
        kisilerTableView.reloadData()
    }
}

