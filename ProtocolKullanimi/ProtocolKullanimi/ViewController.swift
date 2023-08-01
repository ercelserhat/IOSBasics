//
//  ViewController.swift
//  ProtocolKullanimi
//
//  Created by Serhat on 1.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnGecisYap(_ sender: Any) {
        performSegue(withIdentifier: "toDetay", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            let gidilecekVC = segue.destination as! DetayViewController
            gidilecekVC.delegate = self
        }
    }
    
}

extension ViewController: DetayVCToViewControllerProtocol{
    func veriGonder(mesaj: String) {
        labelSonuc.text = mesaj
    }
}
