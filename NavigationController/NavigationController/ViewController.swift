//
//  ViewController.swift
//  NavigationController
//
//  Created by Serhat on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Kod ile Başlık"
        self.navigationItem.prompt = "Kod ile Açıklama"
        
        self.navigationItem.largeTitleDisplayMode = .always
        
        //Image Title
        let logo = UIImage(named: "logo")
        self.navigationItem.titleView = UIImageView(image: logo)
        
    }

    @IBAction func btnHeart(_ sender: Any) {
        print("Liked!")
    }
    
}

