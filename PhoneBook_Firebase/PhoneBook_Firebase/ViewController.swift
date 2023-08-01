//
//  ViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        kisilerTableView.dataSource = self
        kisilerTableView.delegate = self
        searchBar.delegate = self
        
        ref = Database.database().reference()
        tumKisileriAl()
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
        ref.child("kisiler").observe(.value, with: {snapshot in
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject]{
                self.kisilerListe.removeAll()
                for gelenSatirVerisi in gelenVeriButunu{
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_tel = sozluk["kisi_tel"] as? String ?? ""
                        
                        let kisi = Kisiler(kisi_id: key, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        self.kisilerListe.append(kisi)
                    }
                }
            }else{
                self.kisilerListe = [Kisiler]()
            }
            DispatchQueue.main.async {
                self.kisilerTableView.reloadData()
            }
        })
    }
    
    func aramaYap(aramaKelimesi: String){
        ref.child("kisiler").observe(.value, with: {snapshot in
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject]{
                self.kisilerListe.removeAll()
                for gelenSatirVerisi in gelenVeriButunu{
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_tel = sozluk["kisi_tel"] as? String ?? ""
                        
                        if kisi_ad.contains(aramaKelimesi){
                            let kisi = Kisiler(kisi_id: key, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                            self.kisilerListe.append(kisi)
                        }
                    }
                }
            }else{
                self.kisilerListe = [Kisiler]()
            }
            DispatchQueue.main.async {
                self.kisilerTableView.reloadData()
            }
        })
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
            self.ref.child("kisiler").child(kisi.kisi_id).removeValue()
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
        if searchText == ""{
            tumKisileriAl()
        }else{
            aramaYap(aramaKelimesi: searchText)
        }
    }
}

