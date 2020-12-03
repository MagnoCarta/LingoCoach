//
//  CategoryViewCell.swift
//  LingoCoach
//
//  Created by Vitor Bryan on 02/12/20.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    
    let background: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.337254902, blue: 0.6274509804, alpha: 1)
        background.layer.cornerRadius = 8
        background.clipsToBounds = true
        
        return background
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.text = "Categoria"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(background)
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([background.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -20),
                                     background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        
        NSLayoutConstraint.activate([title.centerXAnchor.constraint(equalTo: background.centerXAnchor),
                                     title.centerYAnchor.constraint(equalTo: background.centerYAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
