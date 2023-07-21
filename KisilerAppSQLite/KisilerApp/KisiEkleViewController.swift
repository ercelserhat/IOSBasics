//
//  KisiEkleViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit

class KisiEkleViewController: UIViewController {
    
    @IBOutlet weak var kisiAdiTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func kisiEkleButton(_ sender: Any) {
        if let ad = kisiAdiTextField.text, let tel = kisiTelTextField.text{
            Kisilerdao().kisiEkle(kisi_ad: ad, kisi_tel: tel)
        }
        navigationController?.popViewController(animated: true)
    }
}
