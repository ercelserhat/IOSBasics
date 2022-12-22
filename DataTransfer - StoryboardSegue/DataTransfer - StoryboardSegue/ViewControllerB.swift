//
//  ViewControllerB.swift
//  DataTransfer - StoryboardSegue
//
//  Created by Serhat on 22.12.2022.
//

import UIKit

class ViewControllerB: UIViewController {

    @IBOutlet weak var etiketB: UILabel!
    
    var mesajB: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        etiketB.text = mesajB!
    }
    
    

}
