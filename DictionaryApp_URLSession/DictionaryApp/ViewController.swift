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
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tumKelimeleriAl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! KelimeDetayViewController
        gidilecekVC.kelime = kelimeListesi[indeks!]
    }
    
    func tumKelimeleriAl(){
        let url = URL(string: "http:/kasimadalan.pe.hu/sozluk/tum_kelimeler.php")!
        URLSession.shared.dataTask(with: url){ data, response, error in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            do{
                let cevap = try JSONDecoder().decode(SozlukCevap.self, from: data!)
                if let gelenKelimeListesi = cevap.kelimeler{
                    self.kelimeListesi = gelenKelimeListesi
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func aramaYap(aramaKelimesi: String){
        var request = URLRequest(url: URL(string: "http:/kasimadalan.pe.hu/sozluk/kelime_ara.php")!)
        request.httpMethod = "POST"
        let postString = "ingilizce=\(aramaKelimesi)"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ data, response, error in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            do{
                let cevap = try JSONDecoder().decode(SozlukCevap.self, from: data!)
                if let gelenKelimeListesi = cevap.kelimeler{
                    self.kelimeListesi = gelenKelimeListesi
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
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
        
        aramaYap(aramaKelimesi: searchText)
    }
}
