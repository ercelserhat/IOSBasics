//
//  ViewController3.swift
//  ShowSegue
//
//  Created by Serhat on 20.12.2022.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goto1(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "sayfa1") as! ViewController
        navigationController?.pushViewController(gidilecekViewController, animated: true)
    }
    
    @IBAction func goto2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        navigationController?.pushViewController(gidilecekViewController, animated: true)
    }
    
    @IBAction func anasayfayaGit(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)//en başa döner.
    }
}
