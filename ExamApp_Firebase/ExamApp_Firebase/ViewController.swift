//
//  ViewController.swift
//  NotApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var notTableView: UITableView!
    
    var notlarListe = [Notlar]()
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notTableView.delegate = self
        notTableView.dataSource = self
        
        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tumNotlariAl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNotDetay"{
            let indeks = sender as? Int
            let gidilecekVC = segue.destination as! NotDetayViewController
            gidilecekVC.not = notlarListe[indeks!]
        }
    }
    
    func tumNotlariAl(){
        ref.child("notlar").observe(.value, with: { snapshot in
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject]{
                self.notlarListe.removeAll()
                for gelenSatirVerisi in gelenVeriButunu{
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        let ders_adi = sozluk["ders_adi"] as? String ?? ""
                        let not1 = sozluk["not1"] as? Int ?? 0
                        let not2 = sozluk["not2"] as? Int ?? 0
                        
                        let not = Notlar(not_id: key, ders_adi: ders_adi, not1: not1, not2: not2)
                        self.notlarListe.append(not)
                    }
                }
            }else{
                self.notlarListe = [Notlar]()
            }
            DispatchQueue.main.async {
                var toplam = 0
                for n in self.notlarListe{
                    toplam = toplam + (n.not1 + n.not2) / 2
                }
                if self.notlarListe.count != 0{
                    self.navigationItem.prompt = "Ortalama: \(toplam / self.notlarListe.count)"
                }else{
                    self.navigationItem.prompt = "Ortalama: YOK"
                }
                self.notTableView.reloadData()
            }
        })
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notlarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notlarListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "notHucre", for: indexPath) as! NotHucreTableViewCell
        cell.labelDersAdi.text = not.ders_adi
        cell.labelNot1.text = String(not.not1)
        cell.labelNot2.text = String(not.not2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toNotDetay", sender: indexPath.row)
    }
}

