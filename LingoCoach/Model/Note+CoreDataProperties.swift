//
//  Note+CoreDataProperties.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/25/20.
//
//

import Foundation
import CoreData
import UIKit

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var categories: [String]?
    @NSManaged public var icon: UIImage?
    @NSManaged public var language: String?
    @NSManaged public var summary: String?
    @NSManaged public var title: String?

}

extension Note: Identifiable {

}
