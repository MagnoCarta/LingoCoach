//
//  ColorExtension.swift
//  LingoCoach
//
//  Created by Lucas Fernandes on 24/11/20.
//

import UIKit

extension UIColor {
//    static let background = #colorLiteral(red: 0.9607843137, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
//    static let textBlack = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
//    static let textWhite = #colorLiteral(red: 0.9607843137, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
//    static let brightGreenLC = #colorLiteral(red: 0.1843137255, green: 0.7607843137, blue: 0.6470588235, alpha: 1)
//    static let darkGreenLC = #colorLiteral(red: 0.09411764706, green: 0.3882352941, blue: 0.3764705882, alpha: 1)
//    static let yellowMostard = #colorLiteral(red: 0.8145062327, green: 0.5054685473, blue: 0.2035549283, alpha: 1)
//    static let lightGreenLC  = #colorLiteral(red: 0.1615760028, green: 0.4669166207, blue: 0.1732764244, alpha: 1)
//    static let oceanBlue = #colorLiteral(red: 0.1245598271, green: 0.3738183975, blue: 0.651450634, alpha: 1)
//    static let orangeLC = #colorLiteral(red: 0.975635469, green: 0.418487817, blue: 0.2738820612, alpha: 1)
//    static let grayLC = #colorLiteral(red: 0.399962306, green: 0.400024116, blue: 0.3999488652, alpha: 1)
//    static let darkGrayLC = #colorLiteral(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1)
    static let paleteColor = [darkBlueNL, oldRedNL, darkGreenNL, oldBlueNL, orangeLC, grayLC]
    static var background: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.06708047947, green: 0.1379708904, blue: 0.2, alpha: 1) :
                    UIColor(red: 214 / 255, green: 228 / 255, blue: 240 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 214 / 255, green: 228 / 255, blue: 240 / 255, alpha: 1)
        }
    }
    static var foreground: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.117390839, green: 0.2414490582, blue: 0.35, alpha: 1) :
                    #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 214 / 255, green: 228 / 255, blue: 240 / 255, alpha: 1)
        }
    }
    static var launchBackground: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 43 / 255, green: 45 / 255, blue: 50 / 255, alpha: 1) :
                    UIColor(red: 43 / 255, green: 45 / 255, blue: 50 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 43 / 255, green: 45 / 255, blue: 50 / 255, alpha: 1)
        }
    }
    static var textBlack: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 245 / 255, green: 243 / 255, blue: 244 / 255, alpha: 1) :
                    UIColor(red: 30 / 255, green: 30 / 255, blue: 30 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 30 / 255, green: 30 / 255, blue: 30 / 255, alpha: 1)
        }
    }
    static var textWhite: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 30 / 255, green: 30 / 255, blue: 30 / 255, alpha: 1) :
                    UIColor(red: 246 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 246 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1)
        }
    }
    static var navColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.05701840755, green: 0.1172752569, blue: 0.17, alpha: 1) :
                    UIColor(red: 214 / 255, green: 228 / 255, blue: 240 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 214 / 255, green: 228 / 255, blue: 240 / 255, alpha: 1)
        }
    }
    static var brightBlueNL: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.23, green: 0.5636666667, blue: 1, alpha: 1) :
                    UIColor(red: 30 / 255, green: 86 / 255, blue: 160 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 30 / 255, green: 86 / 255, blue: 160 / 255, alpha: 1)
        }
    }
    static var darkBlueNL: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.5732234589, green: 0.6856202157, blue: 0.9553724315, alpha: 1) :
                    UIColor(red: 55 / 255, green: 80 / 255, blue: 140 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 55 / 255, green: 80 / 255, blue: 140 / 255, alpha: 1)
        }
    }
    // Vermelho tomate
    static var oldRedNL: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.95, green: 0.5763333334, blue: 0.57, alpha: 1) :
                    UIColor(red: 213 / 255, green: 114 / 255, blue: 113 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 213 / 255, green: 114 / 255, blue: 113 / 255, alpha: 1)
        }
    }
    static var darkGreenNL: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.51, green: 0.85, blue: 0.5213333334, alpha: 1) :
                    UIColor(red: 41 / 255, green: 119 / 255, blue: 44 / 255, alpha: 1)
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 41 / 255, green: 119 / 255, blue: 44 / 255, alpha: 1)
        }
    }
    static var oldBlueNL: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.51, green: 0.7423333334, blue: 0.85, alpha: 1) :
                    UIColor(red: 82 / 255, green: 143 / 255, blue: 171 / 255, alpha: 1)
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 82 / 255, green: 143 / 255, blue: 171 / 255, alpha: 1)
        }
    }
    static var orangeLC: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.95, green: 0.6966666666, blue: 0.57, alpha: 1) :
                    UIColor(red: 217 / 255, green: 142 / 255, blue: 104 / 255, alpha: 1)
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 217 / 255, green: 142 / 255, blue: 104 / 255, alpha: 1)
        }
    }
    static var grayLC: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.75, green: 0.75, blue: 0.75, alpha: 1) :
                    UIColor(red: 102 / 255, green: 102 / 255, blue: 102 / 255, alpha: 1)
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 102 / 255, green: 102 / 255, blue: 102 / 255, alpha: 1)
        }
    }
    static var darkGrayLC: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1) :
                    UIColor(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1)
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1)
        }
    }
}
