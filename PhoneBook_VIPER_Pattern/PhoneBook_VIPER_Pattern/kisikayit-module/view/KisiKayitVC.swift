//
//  KisiKayitVC.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import UIKit

class KisiKayitVC: UIViewController {
    
    @IBOutlet weak var textFieldKisiAd: UITextField!
    @IBOutlet weak var textFieldKisiTel: UITextField!
    
    var kisiKayitPresenterNesnesi: ViewToPresenterKisiKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        KisiKayitRouter.createModule(ref: self)
    }
    
    @IBAction func btnKaydet(_ sender: Any) {
        if let ka = textFieldKisiAd.text, let kt = textFieldKisiTel.text{
            kisiKayitPresenterNesnesi?.ekle(kisi_ad: ka, kisi_tel: kt)
        }
    }
}
