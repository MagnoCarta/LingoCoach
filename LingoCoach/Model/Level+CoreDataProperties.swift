//
//  Level+CoreDataProperties.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 19/11/20.
//
//

import Foundation
import CoreData


extension Level {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Level> {
        return NSFetchRequest<Level>(entityName: "Level")
    }

    @NSManaged public var currentLevel: Int64
    @NSManaged public var accumulatedExp: Int64

}

extension Level : Identifiable {

}
