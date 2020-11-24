//
//  ViewController.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/18/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var goal: Goal? {
        didSet {
            guard let goal = goal else {return }
        }
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        view.backgroundColor = .systemGray
        let goals: NSFetchRequest<Goal> = Goal.fetchRequest()
        do {
            let result = try context.fetch(goals)
            print(result[1].title)
            print(result[1].summary)
            print(result[1].icon)
            imageView.image = result[1].icon
        } catch {
            print(error)
        }
//        let goal = Goal(context: context)
//        goal.title = "titulo teste"
//        goal.summary = "teste maluco meu brother"
//        goal.icon = UIImage(systemName: "flame")
//        goal.goalDays = [DaysOfTheWeek.monday.rawValue, DaysOfTheWeek.saturday.rawValue]
//        try! context.save()
    }

}
