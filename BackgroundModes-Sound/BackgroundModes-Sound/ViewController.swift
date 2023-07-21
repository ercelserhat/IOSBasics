//
//  ViewController.swift
//  BackgroundModes-Sound
//
//  Created by Serhat on 21.07.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var sesOynatici: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let dosyaYolu = Bundle.main.path(forResource: "music", ofType: ".mp3")
            sesOynatici = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: dosyaYolu!))
            sesOynatici?.prepareToPlay()
        } catch {
            print(error.localizedDescription)
        }
    }

    @IBAction func BASLA(_ sender: Any) {
        sesOynatici?.play()
    }
    
    @IBAction func DUR(_ sender: Any) {
        sesOynatici?.stop()
    }
}

//Signing & Capabilities > Add Capability > Background Modes > Audio, Airplay and Picture in Picture
