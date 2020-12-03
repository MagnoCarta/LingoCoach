//
//  EditViewControllerDelegate.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 02/12/20.
//

import Foundation

protocol EditViewControllerDelegate: AnyObject {
    func hasSavedNote()
    func hasDeletedNote()
}
