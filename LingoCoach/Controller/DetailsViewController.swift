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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(botView)
        view.addSubview(topView)
        
    }

}
