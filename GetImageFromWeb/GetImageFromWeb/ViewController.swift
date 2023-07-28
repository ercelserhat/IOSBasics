//
//  ViewController.swift
//  GetImageFromWeb
//
//  Created by Serhat on 28.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnResim1(_ sender: Any) {
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/django.png"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }
        }
    }
    
    @IBAction func btnResim2(_ sender: Any) {
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/interstellar.png"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }
        }
    }
}

