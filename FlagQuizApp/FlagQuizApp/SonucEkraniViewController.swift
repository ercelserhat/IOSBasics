//
//  SonucEkraniViewController.swift
//  FlagQuizApp
//
//  Created by Serhat on 17.07.2023.
//

import UIKit

class SonucEkraniViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    
    @IBOutlet weak var labelYuzde: UILabel!
    
    var dogruSayisi: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        if let d = dogruSayisi{
            labelSonuc.text = "\(d) DOĞRU \(5-d) YANLIŞ"
            labelYuzde.text = "%\(d*100/5) Başarı"
        }
    }
    
    @IBAction func tekrarDene(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
