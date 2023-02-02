//
//  ViewController.swift
//  SliderAndStepper
//
//  Created by Serhat on 3.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stepperAction(_ sender: UIStepper) {
        stepperLabel.text = "Stepper: \(Int(sender.value))"
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderLabel.text = "Slider: \(Int(sender.value))"
    }
    
    @IBAction func tikla(_ sender: Any) {
        print("Slider değer: \(Int(slider.value))")
        print("Stepper değer: \(Int(stepper.value))")
    }
}

