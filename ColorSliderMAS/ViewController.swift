//
//  ViewController.swift
//  ColorSliderMAS
//
//  Created by Andrey Matviets on 26.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var paletteView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var red: UITextField!
    @IBOutlet var green: UITextField!
    @IBOutlet var blue: UITextField!
    
    private var startValue = 0.3
    private var minValue = 0
    private var maxValue = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        paletteView.backgroundColor = UIColor(
            red: CGFloat(startValue),
            green: CGFloat(startValue),
            blue: CGFloat(startValue), alpha: 1
        )
    }
    
    @IBAction func setColorForPalette() {
        red.text = String(format: "%.1f", redSlider.value)
        green.text = String(format: "%.1f", greenSlider.value)
        blue.text = String(format: "%.1f", blueSlider.value)
        
        paletteView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value), alpha: 1
        )
    }
    
    private func setupSlider() {
        for slider in [redSlider, greenSlider, blueSlider] {
            slider?.value = Float(startValue)
            slider?.minimumValue = Float(minValue)
            slider?.maximumValue = Float(maxValue)
        }
    }
}

