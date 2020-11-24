//
//  NoteListView.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/24/20.
//

import Foundation
import UIKit

class NoteListView: UIView {
    
    var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Filtrar", for: .normal)
        button.titleLabel?.font = UIFont(name: UIFont.text, size: 17)
        button.setTitleColor(.darkGreenLC, for: .normal)
        return button
    }()
 //   var delegate: NoteListDelegate!
 //   var navigationController: UINavigationController!
    
    override init(frame: CGRect) {
        //navigationItem = delegate.getNavigationController()
        super.init(frame: frame)
        
        addConstraintFilter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraintFilter() {
        self.filterButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(filterButton)
        //self.navigationController.navigationItem.
        NSLayoutConstraint.activate([
            self.filterButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            self.filterButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)])
    }
    
}


