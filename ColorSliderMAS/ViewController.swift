//
//  ViewController.swift
//  ColorSliderMAS
//
//  Created by Andrey Matviets on 26.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var paletteView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var red: UILabel!
    @IBOutlet var green: UILabel!
    @IBOutlet var blue: UILabel!
    
    // MARK: - Private properties
    private let startValue = 0.3
    private let minValue = 0
    private let maxValue = 1
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        
        paletteView.layer.cornerRadius = 20
        paletteView.backgroundColor = UIColor(
            red: CGFloat(startValue),
            green: CGFloat(startValue),
            blue: CGFloat(startValue), alpha: 1
        )
        
        for startFigureColour in [red, green, blue] {
            startFigureColour?.text = String(format: "%.2f", redSlider.value)
        }
    }
    // MARK: - IB Actions
    @IBAction func setColorForPalette() {
        red.text = String(format: "%.2f", redSlider.value)
        green.text = String(format: "%.2f", greenSlider.value)
        blue.text = String(format: "%.2f", blueSlider.value)
        
        paletteView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value), alpha: 1
        )
    }
    // MARK: - Private methods
    private func setupSlider() {
        for slider in [redSlider, greenSlider, blueSlider] {
            slider?.value = Float(startValue)
            slider?.minimumValue = Float(minValue)
            slider?.maximumValue = Float(maxValue)
        }
    }
}

