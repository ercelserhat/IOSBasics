//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var kelimeListesi = [Kelimeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        kelimeListesi = Kelimelerdao().tumKelimeleriAl()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! KelimeDetayViewController
        gidilecekVC.kelime = kelimeListesi[indeks!]
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "sozluk", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten mevcut.")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
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
        return kelimeListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kelime = kelimeListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kelimeHucre", for: indexPath) as! KelimeHucreTableViewCell
        cell.ingilizceLabel.text = kelime.ingilizce
        cell.turkceLabel.text = kelime.turkce
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu: \(searchText)")
        kelimeListesi = Kelimelerdao().aramaYap(ingilizce: searchText)
        tableView.reloadData()
    }
}
