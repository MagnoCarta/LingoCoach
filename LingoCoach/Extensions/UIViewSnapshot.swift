//
//  UIViewSnapshot.swift
//  LingoCoach
//
//  Created by Lucas Fernandes on 27/11/20.
//

import UIKit

extension UIView {
    // render the view within the view's bounds, then capture it as image
  func asImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image(actions: { rendererContext in
        layer.render(in: rendererContext.cgContext)
    })
  }
}
