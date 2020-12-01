//
//  GroupFilterCollectionViewCell.swift
//  LingoCoach
//
//  Created by Lucas Fernandes on 26/11/20.
//

import UIKit

class GroupFilterCollectionViewCell: UICollectionViewCell {
    
    var active: Bool = false {
        didSet {
            if active {
                backgroundColor = .brightGreenLC
                titleLabel.textColor = .background
                
            } else {
                backgroundColor = UIColor.darkGrayLC
                titleLabel.textColor = .background
            }
        }
    }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .background
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.text = "Categoria X"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.darkGrayLC
        layer.cornerRadius = 8
        setupTitleLabel()
    }
    
    func configureCell(title: String) {
        titleLabel.text = title
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func remove() {
        titleLabel.textAlignment = .center
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
