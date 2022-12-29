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
        
        if let tabItems = tabBarController?.tabBar.items{
            let item = tabItems[0]
            item.badgeValue = "1"
        }
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemIndigo
        
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    func renkDegistir(itemAppearance:UITabBarItemAppearance){
        //seçili durum
        itemAppearance.selected.iconColor = .green
        itemAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.green]
        itemAppearance.selected.badgeBackgroundColor = UIColor.black
        //seçili olmayan durum
        itemAppearance.normal.iconColor = .white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor:UIColor.white]
        
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

