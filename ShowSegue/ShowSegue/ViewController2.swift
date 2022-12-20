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
    
    @IBAction func goto3(_ sender: Any) {
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let gidilecekViewController = stroyboard.instantiateViewController(withIdentifier: "sayfa3") as! ViewController3
        navigationController?.pushViewController(gidilecekViewController, animated: true)
    }
    
    @IBAction func geriGit(_ sender: Any) {
        navigationController?.popViewController(animated: true)//Tek sayfa geri gider.
    }
}
