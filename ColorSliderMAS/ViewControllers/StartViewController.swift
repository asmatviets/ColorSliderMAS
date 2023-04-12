//
//  StartViewController.swift
//  ColorSliderMAS
//
//  Created by Andrey Matviets on 11.04.2023.
//

import UIKit


class StartViewController: UIViewController {
    

    
    @IBOutlet var testLabel: UILabel!

    private var color = RGBColor.getRGBColor()
    var redSlider: Float = 0
    var greenSlider: Float = 0
    var blueSlider: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.selectionDelegate = self
        settingsVC.color = color
        settingsVC.redSliderNewValue = redSlider
        settingsVC.greenSliderNewValue = greenSlider
        settingsVC.blueSliderNewValue = blueSlider
    }
    
    private func updateUI() {
        view.backgroundColor = UIColor(
            red: color.red,
            green: color.green,
            blue: color.blue,
            alpha: color.alpha
        )
    }
}

extension StartViewController: SliderSettingsDelegate {
    func didSliderChoice(color: RGBColor, redSlider: Float, greenSlider: Float, blueSlider: Float) {
        self.color = color
        self.redSlider = redSlider
        self.greenSlider = greenSlider
        self.blueSlider = blueSlider
        updateUI()
    }
}
