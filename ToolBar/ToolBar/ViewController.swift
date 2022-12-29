//
//  ViewController.swift
//  ToolBar
//
//  Created by Serhat on 30.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var etiket: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnGeri(_ sender: Any) {
        etiket.text = "Geri"
    }
    
    @IBAction func btnOynat(_ sender: Any) {
        etiket.text = "Oynat"
    }
    
    @IBAction func btnSwift(_ sender: Any) {
        etiket.text = "Swift"
    }
}

