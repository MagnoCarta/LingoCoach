//
//  iconCollecionViewCell.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 12/8/20.
//

import Foundation


//
//  NoteCollectionView.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/25/20.
//

import Foundation
import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    var noteIconView = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        organize()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(icon: UIImage) {
        
        let noteIcon = icon
        noteIconView.image = noteIcon
        noteIconView.tintColor = .textWhite

    }
    
    
    func configure() {
        self.addSubview(noteIconView)
        addConstraintIconView()
    }
    
    func organize() {
        
        self.layer.cornerRadius = 8
        
    }
    
    func addConstraintIconView() {
        //Lembrar de testar
        noteIconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noteIconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            noteIconView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65),
            noteIconView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65),
            noteIconView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
//        noteIconView.contentMode = .scaleAspectFit
    }
    
    
}
