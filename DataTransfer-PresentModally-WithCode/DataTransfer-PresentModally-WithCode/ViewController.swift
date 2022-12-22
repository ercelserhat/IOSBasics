//
//  ViewController.swift
//  DataTransfer-PresentModally-WithCode
//
//  Created by Serhat on 22.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var girdiAlani: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func gonder(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gidilecekViewController = storyboard.instantiateViewController(withIdentifier: "sayfaB") as! ViewController2
        let gidecekKisi = Kisiler(kisiId: 222, kisiAdi: "Serhat")
        gidilecekViewController.kisi = gidecekKisi
        //self.present(gidilecekViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(gidilecekViewController, animated: true)
    }
    
}

