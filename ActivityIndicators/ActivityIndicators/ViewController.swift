//
//  ViewController.swift
//  ActivityIndicators
//
//  Created by Serhat on 3.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
    }

    @IBAction func basla(_ sender: Any) {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    
    @IBAction func dur(_ sender: Any) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
}

