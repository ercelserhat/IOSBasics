//
//  ViewController.swift
//  TabBar
//
//  Created by Serhat on 28.12.2022.
//

import UIKit

class ViewController: UIViewController {

    var profilSayac = 0
    var isSayac = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func profilArttir(_ sender: Any) {
        if let tabItems = tabBarController?.tabBar.items{
            let profilTabBarItem = tabItems[0]
            profilSayac += 1
            profilTabBarItem.badgeColor = UIColor.purple
            profilTabBarItem.badgeValue = String(profilSayac)
        }
    }
    
    @IBAction func isArttir(_ sender: Any) {
        if let tabItems = tabBarController?.tabBar.items{
            let isBarItem = tabItems[1]
            isSayac += 1
            isBarItem.badgeColor = UIColor.red
            isBarItem.badgeValue = String(isSayac)
        }
    }
}

