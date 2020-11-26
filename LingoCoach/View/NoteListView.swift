//
//  NoteListView.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/24/20.
//

import Foundation
import UIKit

class NoteListView: UIView {
    
    let scale = (x: 414 / UIScreen.main.bounds.width, y: 896 / UIScreen.main.bounds.height)
    
    var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: 150, height: 175)
        
        collectionViewFlowLayout.minimumInteritemSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Filtrar", for: .normal)
        button.titleLabel?.font = UIFont(name: UIFont.text, size: 17)
        button.setTitleColor(.darkGreenLC, for: .normal)
        
        button.addTarget(self, action: #selector(filter), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
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
    
    func setupViews() {
        // Prevents a navigation bar large title bug
        self.addSubview(UIView())
        self.addSubview(collectionView)
        addConstraintCollectionView()
        
    }
    
    @objc func filter() {
        
    }
    
    func addConstraintCollectionView() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32 * self.scale.y),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 * self.scale.x),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 * self.scale.x),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
