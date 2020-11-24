//
//  Goal+CoreDataProperties.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 24/11/20.
//
//

import Foundation
import CoreData
import UIKit

extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var title: String?
    @NSManaged public var icon: UIImage?
    @NSManaged public var summary: String?
    @NSManaged public var language: String?
    @NSManaged public var categories: [String]?

}

extension Goal: Identifiable {

}
