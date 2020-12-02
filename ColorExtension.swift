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
    //static let grayLC = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
    //static let darkGrayLC = #colorLiteral(red: 0.462745098, green: 0.462745098, blue: 0.462745098, alpha: 1)
    static let paleteColor = [brightGreenLC, darkGreenLC, yellowMostard, lightGreenLC, oceanBlue, orangeLC, grayLC]
    static var background: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 22 / 255, green: 26 / 255, blue: 29 / 255, alpha: 1) :
                    UIColor(red: 245 / 255, green: 243 / 255, blue: 244 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 245 / 255, green: 243 / 255, blue: 244 / 255, alpha: 1)
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
                    UIColor(red: 245 / 255, green: 243 / 255, blue: 244 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 245 / 255, green: 243 / 255, blue: 244 / 255, alpha: 1)
        }
    }
    static var brightGreenLC: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 53 / 255, green: 217 / 255, blue: 184 / 255, alpha: 1) :
                    UIColor(red: 47 / 255, green: 194 / 255, blue: 165 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 47 / 255, green: 194 / 255, blue: 165 / 255, alpha: 1)
        }
    }
    static var darkGreenLC: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.1649802823, green: 0.6805436644, blue: 0.6633582183, alpha: 1) :
                    UIColor(red: 24 / 255, green: 99 / 255, blue: 96 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 24 / 255, green: 99 / 255, blue: 96 / 255, alpha: 1)
        }
    }
    static var yellowMostard: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 230 / 255, green: 142 / 255, blue: 57 / 255, alpha: 1) :
                    UIColor(red: 208 / 255, green: 129 / 255, blue: 52 / 255, alpha: 1)
                    
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 208 / 255, green: 129 / 255, blue: 52 / 255, alpha: 1)
        }
    }
    static var lightGreenLC: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 48 / 255, green: 140 / 255, blue: 52 / 255, alpha: 1) :
                    UIColor(red: 41 / 255, green: 119 / 255, blue: 44 / 255, alpha: 1)
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 41 / 255, green: 119 / 255, blue: 44 / 255, alpha: 1)
        }
    }
    static var oceanBlue: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 99 / 255, green: 173 / 255, blue: 255 / 255, alpha: 1) :
                    UIColor(red: 32 / 255, green: 95 / 255, blue: 166 / 255, alpha: 1)
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 32 / 255, green: 95 / 255, blue: 166 / 255, alpha: 1)
        }
    }
    static var orangeLC: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    UIColor(red: 250 / 255, green: 151 / 255, blue: 125 / 255, alpha: 1) :
                    UIColor(red: 249 / 255, green: 107 / 255, blue: 70 / 255, alpha: 1)
            }
        } else {
            // Same old color used for iOS 12 and earlier
            return UIColor(red: 249 / 255, green: 107 / 255, blue: 70 / 255, alpha: 1)
        }
    }
    static var grayLC: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ?
                    #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 0.22) :
                    UIColor(red: 232 / 255, green: 232 / 255, blue: 232 / 255, alpha: 1)
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
