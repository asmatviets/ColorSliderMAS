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
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var red: UILabel!
    @IBOutlet var green: UILabel!
    @IBOutlet var blue: UILabel!
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paletteView.layer.cornerRadius = 20
        setColor()
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
    // MARK: - Private methods
    
    private func setColor() {
        paletteView.backgroundColor = UIColor(
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

