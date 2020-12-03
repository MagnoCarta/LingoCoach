//
//  NoteCollectionView.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/25/20.
//

import Foundation
import UIKit

class NoteCollectionViewCell: UICollectionViewCell {
    var note = Note()
    var noteIconView = UIImageView()
    var noteLanguageLabel = UILabel()
    var noteTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        organize()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(note: Note) {
        self.note = note
        noteIconView.image = note.icon
        noteLanguageLabel.text = note.language
        noteTitleLabel.text = note.title

    }
    
    func generateColor(row: Int) {
        self.backgroundColor = UIColor.paleteColor[row%6]
    }
    
    func configure() {
        self.addSubview(noteIconView)
        addConstraintIconView()
        self.addSubview(noteLanguageLabel)
        addConstraintLanguageLabel()
        self.addSubview(noteTitleLabel)
        addConstraintTitleLabel()
    }
    
    func organize() {
        
        self.layer.cornerRadius = 8
        
    }
    
    func addConstraintIconView() {
        //Lembrar de testar
        noteIconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noteIconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            noteIconView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
//        noteIconView.contentMode = .scaleAspectFit
    }
    func addConstraintLanguageLabel() {
        noteLanguageLabel.font = UIFont(name: UIFont.text, size: 18)
        noteLanguageLabel.preferredMaxLayoutWidth = self.frame.width - 16
        noteLanguageLabel.textColor = .textWhite
        noteLanguageLabel.numberOfLines = 1
        noteLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noteLanguageLabel.topAnchor.constraint(equalTo: self.noteIconView.bottomAnchor, constant: 8),
            noteLanguageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    func addConstraintTitleLabel() {
        noteTitleLabel.font = UIFont(name: UIFont.text, size: 18)
        noteTitleLabel.preferredMaxLayoutWidth = self.frame.width - 16
        noteTitleLabel.textColor = .textWhite
        noteTitleLabel.numberOfLines = 2
        noteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noteTitleLabel.topAnchor.constraint(equalTo: self.noteLanguageLabel.bottomAnchor, constant: 8),
            noteTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    
}
