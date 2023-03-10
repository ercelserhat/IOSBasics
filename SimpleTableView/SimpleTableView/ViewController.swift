//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Serhat on 9.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ulkeler: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye", "Almanya", "Rusya", "İtalya", "Japonya", "İngiltere", "Güney Kore", "Fransa"]
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

//Extension ile kullanımı
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    //Kaç bölüm
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Kaç veri
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulkeler.count
    }
    
    //Verileri yerleştiriyoruz
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucreAdi", for: indexPath)
        cell.textLabel?.text = ulkeler[indexPath.row]
        return cell
    }
    
    //Seçme işlemi
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seçilen Ülke: \(ulkeler[indexPath.row])")
    }
    
    
    //Add buttons
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil", handler: {
            (contextualAction, view, boolValue) -> Void in
            print("\(self.ulkeler[indexPath.row])'yi sil.")
        })
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle", handler: {
            (contextualAction, view, boolValue) -> Void in
            print("\(self.ulkeler[indexPath.row])'yi düzenle.")
        })
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    
        }
}
