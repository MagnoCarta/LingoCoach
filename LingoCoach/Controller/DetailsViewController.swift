//
//  DetailsViewController.swift
//  LingoCoach
//
//  Created by Vitor Bryan on 24/11/20.
//

import UIKit

class DetailsViewController: UIViewController {

    fileprivate let botView: UIView = {
        let botView = UIView()
        botView.translatesAutoresizingMaskIntoConstraints = false
        return botView
    }()
    
    fileprivate let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
    fileprivate let content: Description = {
        let content = Description()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .white
        
        view.addSubview(botView)
        view.addSubview(topView)
        view.addSubview(content)
        
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.098).isActive = true
        
        botView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        botView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        botView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        botView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        content.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: botView.topAnchor).isActive = true
        content.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}
