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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraintFilter(viewBar: UIView) {
        self.filterButton.translatesAutoresizingMaskIntoConstraints = false
        viewBar.addSubview(filterButton)
        NSLayoutConstraint.activate([
            self.filterButton.bottomAnchor.constraint(equalTo: viewBar.bottomAnchor, constant: -8),
            self.filterButton.trailingAnchor.constraint(equalTo: viewBar.trailingAnchor, constant: -16)])
    }
    
}


