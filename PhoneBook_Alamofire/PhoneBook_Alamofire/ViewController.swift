//
//  ViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    var aramaYapiliyormu = false
    var aramaKelimesi: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        kisilerTableView.dataSource = self
        kisilerTableView.delegate = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if aramaYapiliyormu{
            aramaYap(aramaKelimesi: aramaKelimesi!)
        }else{
            tumKisileriAl()
        }
        
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
    
    func tumKisileriAl(){
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    if let gelenKisiListesi = cevap.kisiler{
                        self.kisilerListe = gelenKisiListesi
                    }else{
                        self.kisilerListe = [Kisiler]()
                    }
                    DispatchQueue.main.async {
                        self.kisilerTableView.reloadData()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func aramaYap(aramaKelimesi: String){
        let params: Parameters = ["kisi_ad" : aramaKelimesi]
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    if let gelenKisiListesi = cevap.kisiler{
                        self.kisilerListe = gelenKisiListesi
                    }
                    DispatchQueue.main.async {
                        self.kisilerTableView.reloadData()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisiSil(kisi_id: Int){
        let params: Parameters = ["kisi_id" : kisi_id]
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response{ response in
            if let data = response.data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]{
                        print(json)
                        if self.aramaYapiliyormu{
                            self.aramaYap(aramaKelimesi: self.aramaKelimesi!)
                        }else{
                            self.tumKisileriAl()
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
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
        cell.kisiYaziLabel.text = "\(kisi.kisi_ad)-\(kisi.kisi_tel)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toKisiDetay", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualaction, view, boolValue in
            let kisi = self.kisilerListe[indexPath.row]
            if let kid = Int(kisi.kisi_id){
                self.kisiSil(kisi_id: kid)
            }
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
        aramaYap(aramaKelimesi: aramaKelimesi!)
    }
}

