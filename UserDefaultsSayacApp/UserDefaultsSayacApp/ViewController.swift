//
//  ViewController.swift
//  UserDefaultsSayacApp
//
//  Created by Serhat on 10.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sayacLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userDefaults = UserDefaults.standard
        
        var sayac = userDefaults.integer(forKey: "sayac")
        sayac += 1
        
        userDefaults.set(sayac, forKey: "sayac")
        
        sayacLabel.text = "Sayaç: \(sayac)"
    }


}

