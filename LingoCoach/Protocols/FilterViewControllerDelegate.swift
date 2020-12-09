//
//  FilterViewControllerDelegate.swift
//  LingoCoach
//
//  Created by Lucas Fernandes on 08/12/20.
//

import Foundation

protocol FilterViewControllerDelegate: AnyObject {
    func updateView(notesDelegate: [Note])
}
