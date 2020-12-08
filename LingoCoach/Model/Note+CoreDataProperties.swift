//
//  Note+CoreDataProperties.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 07/12/20.
//
//

import Foundation
import CoreData
import UIKit

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var category: String?
    @NSManaged public var icon: UIImage?
    @NSManaged public var language: String?
    @NSManaged public var summary: String?
    @NSManaged public var title: String?

}

extension Note: Identifiable {

}
