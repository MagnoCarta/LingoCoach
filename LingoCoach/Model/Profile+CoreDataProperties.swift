//
//  Profile+CoreDataProperties.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 19/11/20.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var icon: UIImage?
    @NSManaged public var name: String?
    @NSManaged public var level: Level?

}

extension Profile : Identifiable {

}
