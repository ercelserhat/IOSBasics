//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var kelimeListesi = [Kelimeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        tumKelimeleriAl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! KelimeDetayViewController
        gidilecekVC.kelime = kelimeListesi[indeks!]
    }
    
    func tumKelimeleriAl(){
        AF.request("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php", method: .get).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(SozlukCevap.self, from: data)
                    if let gelenKelimeListesi = cevap.kelimeler{
                        self.kelimeListesi = gelenKelimeListesi
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kelimeAra(aranacakKelime: String){
        let params: Parameters = ["ingilizce" : aranacakKelime]
        AF.request("http://kasimadalan.pe.hu/sozluk/kelime_ara.php", method: .post, parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(SozlukCevap.self, from: data)
                    if let gelenKelimeListesi = cevap.kelimeler{
                        self.kelimeListesi = gelenKelimeListesi
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
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
        kelimeAra(aranacakKelime: searchText)
    }
}
