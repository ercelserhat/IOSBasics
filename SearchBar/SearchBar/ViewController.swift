//
//  ViewController.swift
//  SearchBar
//
//  Created by Serhat on 10.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        
        searchBar.scopeButtonTitles = ["Birinci", "İkinci"]
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonuç: \(searchText)")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel seçildi.")
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0{
            print("Birinci Seçildi.")
        }
        if selectedScope == 1{
            print("İkinci Seçildi.")
        }
    }
}
