//
//  ViewControllerC.swift
//  DataTransfer-PerformSegue
//
//  Created by Serhat on 27.12.2022.
//

import UIKit

class ViewControllerC: UIViewController {

    @IBOutlet weak var etiketC: UILabel!
    
    var mesajC:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etiketC.text = mesajC!
       
    }
    

}
