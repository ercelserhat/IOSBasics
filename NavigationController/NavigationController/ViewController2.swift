//
//  ViewController2.swift
//  NavigationController
//
//  Created by Serhat on 27.12.2022.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func segmentTiklandi(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("First Tıklandı.")
        case 1:
            print("Second Tıklandı.")
        default:
            break
        }
    }
}
