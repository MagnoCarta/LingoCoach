//
//  UIApplicationExtension.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 27/11/20.
//

import UIKit
import CoreData

extension UIApplication {
    var context: NSManagedObjectContext {
        (self.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
