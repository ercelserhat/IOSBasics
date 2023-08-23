//
//  ViewController.swift
//  Animations
//
//  Created by Serhat on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func alphaAnimation(_ sender: Any) {
        self.animationLabel.alpha = 1
        UIView.animate(withDuration: 5, animations: {
            self.animationLabel.alpha = 0
        }, completion: nil)
    }
}
