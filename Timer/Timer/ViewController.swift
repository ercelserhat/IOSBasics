//
//  ViewController.swift
//  Timer
//
//  Created by Serhat on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    
    var sayici: Timer?
    var sayac1: Int = 1
    var sayac2: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSonuc.text = ""
    }

    @IBAction func btnBasla(_ sender: Any) {
        sayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(geriSay), userInfo: nil, repeats: true)
    }
    
    @objc func ileriSay(){
        labelSonuc.text = String(sayac1)
        sayac1 += 1
        if sayac1 > 6{
            sayici?.invalidate()
            labelSonuc.text = "Süre bitti"
            sayac1 = 1
        }
    }
    
    @objc func geriSay(){
        labelSonuc.text = String(sayac2)
        sayac2 -= 1
        if sayac2 < 0{
            sayici?.invalidate()
            labelSonuc.text = "Süre bitti"
            sayac2 = 5
        }
    }
}

