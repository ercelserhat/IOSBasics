//
//  ViewController.swift
//  Outlet-Action
//
//  Created by Serhat on 20.12.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "Merhaba!"
    }


    @IBAction func tikla(_ sender: Any) {
        myLabel.text = "Butona Tıklandı!"
    }
}

