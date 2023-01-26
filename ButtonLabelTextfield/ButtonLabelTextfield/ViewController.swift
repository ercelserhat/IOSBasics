//
//  ViewController.swift
//  ButtonLabelTextfield
//
//  Created by Serhat on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var etiket: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tikla(_ sender: Any) {
        if let alinanVeri = textfield.text{
            etiket.text = alinanVeri
        }
    }
    
}

