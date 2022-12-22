//
//  ViewController2.swift
//  DataTransfer-PresentModally-WithCode
//
//  Created by Serhat on 22.12.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var etiket: UILabel!
    
    var kisi = Kisiler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Kisi id: \(kisi.kisiId!), Kisi adı: \(kisi.kisiAdi!)")
    }

}
