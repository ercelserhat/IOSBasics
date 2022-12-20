//
//  ViewController2.swift
//  ShowSegue
//
//  Created by Serhat on 20.12.2022.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func geriGit(_ sender: Any) {
        navigationController?.popViewController(animated: true)//Tek sayfa geri gider.
    }
    

}
