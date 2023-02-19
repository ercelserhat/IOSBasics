//
//  ViewController.swift
//  TableView - Custom Cell
//
//  Created by Serhat on 19.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let kisi1 = Kisiler(kisiId: 1, kisiAdi: "Serhat", kisiTel: "0123456789")
        let kisi2 = Kisiler(kisiId: 2, kisiAdi: "Ahmet", kisiTel: "0123456789")
        let kisi3 = Kisiler(kisiId: 3, kisiAdi: "Mehmet", kisiTel: "0123456789")
        let kisi4 = Kisiler(kisiId: 4, kisiAdi: "Ali", kisiTel: "0123456789")
        let kisi5 = Kisiler(kisiId: 5, kisiAdi: "Veli", kisiTel: "0123456789")
        
        kisilerListe.append(kisi1)
        kisilerListe.append(kisi2)
        kisilerListe.append(kisi3)
        kisilerListe.append(kisi4)
        kisilerListe.append(kisi5)
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource, TableViewHucreProtocol{
    
    func hucreUzerindekiButtonTiklandi(indexPath: IndexPath) {
        print("Button Tıklandı: \(kisilerListe[indexPath.row].kisiAdi!)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        kisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let gelenKisi = kisilerListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre", for: indexPath) as! TableViewHucre
        
        cell.kisiAdLabel.text = "\(gelenKisi.kisiAdi!) - \(gelenKisi.kisiTel!)"
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gelenKisi = kisilerListe[indexPath.row]
        print("ID: \(gelenKisi.kisiId!), Adı: \(gelenKisi.kisiAdi!), Tel: \(gelenKisi.kisiTel!)")
    }
}


