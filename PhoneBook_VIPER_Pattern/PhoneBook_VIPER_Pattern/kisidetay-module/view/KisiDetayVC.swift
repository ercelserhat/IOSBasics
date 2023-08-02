//
//  KisiDetayVC.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import UIKit

class KisiDetayVC: UIViewController {

    @IBOutlet weak var textFieldKisiAd: UITextField!
    @IBOutlet weak var textFieldKisiTel: UITextField!
    
    var kisi: Kisiler?
    
    var kisiDetayPresenterNesnesi: ViewToPresenterKisiDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KisiDetayRouter.createModule(ref: self)

        if let k = kisi{
            textFieldKisiAd.text = k.kisi_ad
            textFieldKisiTel.text = k.kisi_tel
        }
    }

    @IBAction func btnGuncelle(_ sender: Any) {
        if let k = kisi, let ka = textFieldKisiAd.text, let kt = textFieldKisiTel.text{
            kisiDetayPresenterNesnesi?.guncelle(kisi_id: k.kisi_id, kisi_ad: ka, kisi_tel: kt)
        }
    }
}
