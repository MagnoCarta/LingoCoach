//
//  iconView.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 12/8/20.
//

import Foundation
import UIKit

class MyIconView: UIView {
        
        var collectionView: UICollectionView = {
            let collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: 150 * UIScreen.scale.x, height: 200 * UIScreen.scale.y)
            
            collectionViewFlowLayout.minimumInteritemSpacing = 16
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
            collectionView.backgroundColor = .background
            return collectionView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupViews() {
            // Prevents a navigation bar large title bug
            self.addSubview(UIView())
            self.addSubview(collectionView)
            addConstraintCollectionView()
            
        }
        func addConstraintCollectionView() {
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0 * UIScreen.scale.y),
                collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0 * UIScreen.scale.x),
                collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0 * UIScreen.scale.x),
                collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
        }
    

   
    
    
    
}
