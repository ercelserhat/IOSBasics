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

    @IBAction func tiklaDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
