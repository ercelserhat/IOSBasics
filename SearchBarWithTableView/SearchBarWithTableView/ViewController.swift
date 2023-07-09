//
//  ViewController.swift
//  SearchBarWithTableView
//
//  Created by Serhat on 10.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var ulkeler:[String] = [String]()
    var aramaSonucuUlkeler: [String] = [String]()
    var aramaYapiliyormu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye", "Almanya", "Japonya", "Rusya", "İtalya", "Güney Kore", "Fransa", "Mısır"]
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if aramaYapiliyormu{
            return aramaSonucuUlkeler.count
        }else{
            return ulkeler.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ulkelerHucre", for: indexPath)
        if aramaYapiliyormu{
            cell.textLabel?.text = aramaSonucuUlkeler[indexPath.row]
        }else{
            cell.textLabel?.text = ulkeler[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if aramaYapiliyormu{
            print("Seçilen Ülke: \(aramaSonucuUlkeler[indexPath.row])")
        }else{
            print("Seçilen Ülke: \(ulkeler[indexPath.row])")
        }
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonucu: \(searchText)")
        if searchText == ""{
            aramaYapiliyormu = false
        }else{
            aramaYapiliyormu = true
            aramaSonucuUlkeler = ulkeler.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        tableView.reloadData()
    }
}

