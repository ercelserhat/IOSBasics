//
//  ViewController.swift
//  SegueTransitionWithCode
//
//  Created by Serhat on 22.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goto2(_ sender: Any) {
        let nesne = Kisiler(kisiId: 222, kisiAd: "Serhat")
        performSegue(withIdentifier: "gofrom1to2", sender: nesne)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gelenVeri = sender as? Kisiler
        print("Gelen veri: \(gelenVeri!.kisiAd!) - \(gelenVeri!.kisiId!)")
        print("Geçiş 1'den 2'ye")
    }
}

