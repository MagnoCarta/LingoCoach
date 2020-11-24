//
//  Statistics.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 19/11/20.
//

import Foundation

class Progress {

    /// Calculates the days of the current week in which the user was active
    /// - Parameter completedGoals: The goals which were completed
    /// - Returns: The days of the current week in which the user was active
    func calculateSequence(completedGoals: [Goal]) -> [DaysOfTheWeek] {
        return []
    }
    
    /// Generates an array of pairs of subdivisions of a period and the points earned in that period
    /// - Parameters:
    ///   - completedGoals: The goals which were completed
    ///   - period: The period of analysis
    /// - Returns: an array of pairs of subdivisions of a period and the points earned in that period
    func generatePoints(completedGoals: [Goal], period: Period) -> [(Int, Int)] {
        return []
    }
    
    /// Plots data points into a graph
    /// - Parameters:
    ///   - period: The period of analysis
    ///   - dataPoints: The data points to be plotted in the graph
    func plotGraph(period: Int, dataPoints: [(Int, Int)]) {
        
    }
}
