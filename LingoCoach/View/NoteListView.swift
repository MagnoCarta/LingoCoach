//
//  NoteListView.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/24/20.
//

import Foundation
import UIKit

class NoteListView: UIView {
    
    var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: 150, height: 175)
        collectionViewFlowLayout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Filtrar", for: .normal)
        button.titleLabel?.font = UIFont(name: UIFont.text, size: 17)
        button.setTitleColor(.darkGreenLC, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        organize()
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
    
    
    func organize(){
        
        self.addSubview(collectionView)
        
        addConstraintCollectionView()
        
    }
    
    
    
    
    
    func addConstraintCollectionView() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:0)
        ])
    }
}
