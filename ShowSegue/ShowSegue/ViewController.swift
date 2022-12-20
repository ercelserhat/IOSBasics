//
//  ViewController.swift
//  ShowSegue
//
//  Created by Serhat on 20.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goto2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        navigationController?.pushViewController(gidilecekViewController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotofrom1to3"{
            print("Sayfa 1'den sayfa 3'e geçiş yapıldı.")
        }
    }
}

