//
//  ViewController.swift
//  Animations
//
//  Created by Serhat on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationLabel: UILabel!
    
    @IBOutlet weak var fabMain: UIButton!
    @IBOutlet weak var fabBirinci: UIButton!
    @IBOutlet weak var fabIkinci: UIButton!
    
    var fabDurum = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fabMain.layer.cornerRadius = fabMain.frame.size.width / 2
        fabBirinci.layer.cornerRadius = fabBirinci.frame.size.width / 2
        fabIkinci.layer.cornerRadius = fabIkinci.frame.size.width / 2
        
        self.fabBirinci.alpha = 0
        self.fabIkinci.alpha = 0
        self.fabBirinci.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.fabIkinci.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
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
    @IBAction func sequentialAnimation(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.animationLabel.transform = CGAffineTransform(scaleX: 2, y: 1)
        }, completion: {(true) in
            UIView.animate(withDuration: 1, animations: {
                self.animationLabel.transform = CGAffineTransform(scaleX: 1, y: 2)
            }, completion: {(true) in
                UIView.animate(withDuration: 1, animations: {
                    self.animationLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: {(true) in
                    print("Ardışık animasyon bitti.")
                })
            })
        })
    }
    
    @IBAction func fabMainTikla(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            if self.fabDurum{
                self.fabBirinci.alpha = 0
                self.fabIkinci.alpha = 0
                
                self.fabMain.transform = CGAffineTransform(rotationAngle: 0 * .pi / 180)
                self.fabBirinci.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.fabIkinci.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                
                self.fabDurum = false
            }else{
                self.fabBirinci.alpha = 1
                self.fabIkinci.alpha = 1
                
                self.fabMain.transform = CGAffineTransform(rotationAngle: 45 * .pi / 180)
                self.fabBirinci.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.fabIkinci.transform = CGAffineTransform(scaleX: 1, y: 1)
                
                self.fabDurum = true
            }
        }, completion: nil)
    }
    
    @IBAction func fabBirinciTikla(_ sender: Any) {
    }
    
    @IBAction func fabIkinciTikla(_ sender: Any) {
    }
    
}
