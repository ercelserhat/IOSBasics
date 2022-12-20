//
//  ViewController2.swift
//  Segue-PresentModally
//
//  Created by Serhat on 20.12.2022.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goto3(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "sayfa3") as! ViewController3
        self.present(gidilecekViewController, animated: true, completion: nil)
    }
    @IBAction func tiklaDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
