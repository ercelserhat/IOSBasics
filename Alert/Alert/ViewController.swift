//
//  ViewController.swift
//  Alert
//
//  Created by Serhat on 4.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func basitAlertGoster(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){
            action in
            print("İptal Tıklandı.")
        }
        
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
            action in
            print("Tamam Tıklandı.")
        }
        
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
    
    @IBAction func ozelAlertGoster(_ sender: Any) {
    }
    
    @IBAction func actionSheetGoster(_ sender: Any) {
    }
}

