//
//  DetayViewController.swift
//  ProtocolKullanimi
//
//  Created by Serhat on 1.08.2023.
//

import UIKit

class DetayViewController: UIViewController {

    @IBOutlet weak var textFieldGirdi: UITextField!
    
    var delegate: DetayVCToViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnGonder(_ sender: Any) {
        if let mesaj = textFieldGirdi.text{
            delegate?.veriGonder(mesaj: mesaj)
        }
    }
    
}
