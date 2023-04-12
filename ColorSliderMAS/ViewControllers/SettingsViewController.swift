//
//  ViewController.swift
//  ColorSliderMAS
//
//  Created by Andrey Matviets on 26.03.2023.
//

import UIKit

protocol SliderSettingsDelegate {
    func didSliderChoice(color: RGBColor, redSlider: Float, greenSlider: Float, blueSlider: Float)
}

final class SettingsViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var paletteView: UIView!
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var red: UILabel!
    @IBOutlet var green: UILabel!
    @IBOutlet var blue: UILabel!
    
    var color: RGBColor!
    var selectionDelegate: SliderSettingsDelegate!
    
    var redSliderNewValue: Float!
    var greenSliderNewValue: Float!
    var blueSliderNewValue: Float!
    
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paletteView.layer.cornerRadius = 20
        paletteView.backgroundColor = UIColor(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
        navigationItem.hidesBackButton = true
        redSlider.value = redSliderNewValue
        greenSlider.value = greenSliderNewValue
        blueSlider.value = blueSliderNewValue
        
        red.text = string(from: redSlider)
        green.text = string(from: greenSlider)
        blue.text = string(from: blueSlider)
    }
    // MARK: - IB Actions
    @IBAction func setColorForPalette(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            red.text = string(from: redSlider)
        case greenSlider:
            green.text = string(from: greenSlider)
        default:
            blue.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        selectionDelegate.didSliderChoice(
            color: color,
            redSlider: redSlider.value,
            greenSlider: greenSlider.value,
            blueSlider: blueSlider.value
        )
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    
    private func setColor() {
        paletteView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        color = RGBColor (
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

