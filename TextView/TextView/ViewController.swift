//
//  ViewController.swift
//  TextView
//
//  Created by Serhat on 3.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnYazdir(_ sender: Any) {
        if let alinanVeri = textField.text{
            textView.text = alinanVeri
        }
    }
    
    
}

