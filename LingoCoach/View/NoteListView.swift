//
//  NoteListView.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/24/20.
//

import Foundation
import UIKit

protocol delegateFilter: class {
    func filterAction()
}

class NoteListView: UIView {
    
    weak var delegate: delegateFilter?
    
    var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: 150 * UIScreen.scale.x, height: 200 * UIScreen.scale.y)
        
        collectionViewFlowLayout.minimumInteritemSpacing = 16
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .background
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
        filterButton.addTarget(self, action: #selector(addFilter), for: .touchUpInside)
        setupViews()
    }
    
    @objc func addFilter() {
        delegate!.filterAction()
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
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32 * UIScreen.scale.y),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0 * UIScreen.scale.x),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0 * UIScreen.scale.x),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
