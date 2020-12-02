//
//  Page.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 12/2/20.
//
import Foundation
import UIKit

extension UIColor {
    static var mainRed = UIColor(red: 200/255, green: 50/255, blue: 33/255, alpha: 1)
    static var justRed =  UIColor(red: 216/255, green: 156/255, blue: 65/255, alpha: 1)
    
}

struct Page {
    let imageName: String
    let headerText: String
    let otherText: String
}
