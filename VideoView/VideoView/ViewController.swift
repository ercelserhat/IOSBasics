//
//  ViewController.swift
//  VideoView
//
//  Created by Serhat on 3.02.2023.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBasla(_ sender: Any) {
        if let dosyaYolu = Bundle.main.path(forResource: "video", ofType: "mp4"){
            let oynatici = AVPlayer(url: URL(fileURLWithPath: dosyaYolu))
            let oynaticiKontrol = AVPlayerViewController()
            oynaticiKontrol.player = oynatici
            present(oynaticiKontrol, animated: true){
                oynatici.play()
            }
        }
    }
    
}

