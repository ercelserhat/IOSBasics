//
//  ViewController2.swift
//  NotificationCenterProject
//
//  Created by Serhat on 21.07.2023.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func bildirimGonder(_ sender: Any) {
        let kisi = Kisiler(kisiAd: "Serhat", kisiYas: 31)
        NotificationCenter.default.post(name: .bildirimAdi, object: nil, userInfo: ["mesaj":"merhaba", "tarih": Date(), "nesne":kisi])
        dismiss(animated: true)
    }
}
