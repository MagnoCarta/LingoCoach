//
//  Level+CoreDataClass.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 19/11/20.
//
//

import Foundation
import CoreData

@objc(Level)
public class Level: NSManagedObject {
    
    private func tryLevelUp() {
        let necessaryExp = calculateNecessaryExp()
        if accumulatedExp >= necessaryExp {
            currentLevel += 1
            accumulatedExp = 0
        }
    }
    
    func earnExp(goal: Goal) {
        accumulatedExp += goal.points
        tryLevelUp()
    }
    
    private func calculateNecessaryExp() -> Int64 {
        return (currentLevel - 1) * 2 + 5
    }
    
}
