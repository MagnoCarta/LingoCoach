//
//  Goal+CoreDataProperties.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 19/11/20.
//
//

import Foundation
import CoreData
import UIKit

extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var categories: [String]?
    @NSManaged public var duration: Date?
    @NSManaged public var endTime: Date?
    @NSManaged public var goalDays: [String]?
    @NSManaged public var icon: UIImage?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var isNotificationActive: Bool
    @NSManaged public var points: Int64
    @NSManaged public var summary: String?
    @NSManaged public var title: String?

}

extension Goal : Identifiable {

}
