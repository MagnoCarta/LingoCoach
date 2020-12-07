//
//  UIResponderExtension.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/24/20.
//

import Foundation
import UIKit

extension UIResponder {
    public var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
