//
//  ViewController2.swift
//  DataTransfer-PresentModally-WithCode
//
//  Created by Serhat on 22.12.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var etiket: UILabel!
    
    var mesaj: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etiket.text = mesaj!
        
    }

}
