//
//  ViewController.swift
//  ImageView
//
//  Created by Serhat on 3.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnResim1(_ sender: Any) {
        imageView.image = UIImage(named: "resim1")
    }
    
    @IBAction func btnResim2(_ sender: Any) {
        imageView.image = UIImage(named: "resim2")
    }
}

