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
    
    @IBAction func scaleAnimation(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.animationLabel.transform = CGAffineTransform(scaleX: 2, y: 1)
        }, completion: nil)
    }
    
    @IBAction func rotateAnimation(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.animationLabel.transform = CGAffineTransform(rotationAngle: 90 * .pi / 180)
        }, completion: nil)
    }
    
    @IBAction func translationAnimation(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: {
            self.animationLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        }, completion: nil)
    }
    
    @IBAction func repeatAnimation(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            self.animationLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        }, completion: nil)
    }
    
    @IBAction func multipleAnimation(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            let hareket = CGAffineTransform(translationX: 0, y: 50)
            let kucul = CGAffineTransform(scaleX: 0.5, y: 0.5)
            let don = CGAffineTransform(rotationAngle: 90 * .pi / 180)
            
            let x = hareket.concatenating(kucul)
        
            self.animationLabel.transform = don.concatenating(x)
            self.animationLabel.alpha = 0.5
        }, completion: nil)
    }
}
