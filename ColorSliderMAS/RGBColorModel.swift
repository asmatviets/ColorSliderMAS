//
//  RGRColorModel.swift
//  ColorSliderMAS
//
//  Created by Andrey Matviets on 11.04.2023.
//

import Foundation


struct RGBColor {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
    
    static func getRGBColor() -> RGBColor {
        RGBColor(red: 0.98, green: 0.95, blue: 0.85, alpha: 1)
    }
}
