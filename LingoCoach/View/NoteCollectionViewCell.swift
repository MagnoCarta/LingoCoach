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
        let noteIcon = note.icon?.withRenderingMode(.alwaysTemplate)
        noteIconView.image = noteIcon
        noteIconView.tintColor = .textWhite
        noteLanguageLabel.text = note.language
        noteTitleLabel.text = note.title

    }
    
    func generateColor(row: Int) {
        self.backgroundColor = UIColor.paleteColor[row%6]
    }
    
    func configure() {
        self.addSubview(noteIconView)
        self.addSubview(noteLanguageLabel)
        self.addSubview(noteTitleLabel)
        
        addConstraintIconView()
        addConstraintLanguageLabel()
        addConstraintTitleLabel()
    }
    
    func organize() {
        
        self.layer.cornerRadius = 8
        
    }
    
    func addConstraintIconView() {
        //Lembrar de testar
        noteIconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noteIconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            noteIconView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            noteIconView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            noteIconView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
//        noteIconView.contentMode = .scaleAspectFit
    }
    func addConstraintLanguageLabel() {
        noteLanguageLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        noteLanguageLabel.preferredMaxLayoutWidth = self.frame.width - 16
        noteLanguageLabel.textColor = .textWhite
        noteLanguageLabel.numberOfLines = 1
        noteLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noteLanguageLabel.bottomAnchor.constraint(equalTo: self.noteLanguageLabel.topAnchor),
            noteLanguageLabel.topAnchor.constraint(equalTo: self.noteIconView.bottomAnchor),
            noteLanguageLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            noteLanguageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    func addConstraintTitleLabel() {
        noteTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        noteTitleLabel.preferredMaxLayoutWidth = self.frame.width - 16
        noteTitleLabel.textColor = .textWhite
        noteTitleLabel.numberOfLines = 2
        noteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noteTitleLabel.topAnchor.constraint(equalTo: self.noteLanguageLabel.bottomAnchor, constant: -10),
            noteTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            noteTitleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            noteTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    
}
