//
//  ViewController3.swift
//  ShowSegue
//
//  Created by Serhat on 20.12.2022.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func anasayfayaGit(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)//en başa döner.
    }
   
}
