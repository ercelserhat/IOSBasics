//
//  KisiGuncelleViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit

class KisiGuncelleViewController: UIViewController {

    @IBOutlet weak var kisiAdiTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var kisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi{
            kisiAdiTextField.text = k.kisi_ad
            kisiTelTextField.text = k.kisi_tel
        }
    }
    
    @IBAction func kisiGuncelleButton(_ sender: Any) {
        if let k = kisi, let ad = kisiAdiTextField.text, let tel = kisiTelTextField.text{
            Kisilerdao().kisiGuncelle(kisi_id: k.kisi_id, kisi_ad: ad, kisi_tel: tel)
        }
        navigationController?.popViewController(animated: true)
    }
}
