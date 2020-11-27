//
//  Description.swift
//  LingoCoach
//
//  Created by Vitor Bryan on 24/11/20.
//

import UIKit

class Description: UIView {

    let icon: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "translate")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
        
    }()
    
    let iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0.3953939676, blue: 0.378708303, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()

    fileprivate let descriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = #colorLiteral(red: 0.909702003, green: 0.9098611474, blue: 0.9097036719, alpha: 1)
        return view
    }()
    
    fileprivate let notesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = #colorLiteral(red: 0.9111861587, green: 0.9112922549, blue: 0.9111371636, alpha: 1)
        return view
    }()
    
    fileprivate let addCategory: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "add")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = #colorLiteral(red: 0, green: 0.7753016353, blue: 0.6421442628, alpha: 1)
//        action
        return button
        
    }()
    
    let category: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("Categoria", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.001636183239, green: 0.7755811214, blue: 0.6421516538, alpha: 1)
        return button
        
    }()
    
    let favorite: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "favorite")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
//        button.backgroundColor =
//        action
        return button
    
    }()
    
    fileprivate let language: UILabel = {
        let text = UILabel()
        text.text = "Idioma"
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
        
    }()
    
    let languageSelected: UILabel = {
        let text = UILabel()
        text.text = "Nenhum"
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
        
    }()
    
    let notes: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
//        text.text = "Digite suas anotações aqui.."
//        text.textColor = UIColor.lightGray
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.backgroundColor = #colorLiteral(red: 0.9111861587, green: 0.9112922549, blue: 0.9111371636, alpha: 1)
        return text
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(iconView)
        addSubview(icon)
        addSubview(descriptionView)
        addSubview(notesView)
        addSubview(category)
        addSubview(addCategory)
        addSubview(favorite)
        addSubview(language)
        addSubview(languageSelected)
        addSubview(notes)
        
        //Constraints da Descrição
        
        NSLayoutConstraint.activate([iconView.widthAnchor.constraint(equalToConstant: 120),
                                     iconView.heightAnchor.constraint(equalToConstant: 120),
                                     iconView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                                     iconView.centerXAnchor.constraint(equalTo: centerXAnchor)])
        
        NSLayoutConstraint.activate([icon.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 13),
                                     icon.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
//                                     icon.trailingAnchor.constraint(equalTo: iconView.trailingAnchor),
                                     icon.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.8),
                                     icon.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 0.8)])
        
        NSLayoutConstraint.activate([descriptionView.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 26),
                                     descriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     descriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                     descriptionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)])
        
        NSLayoutConstraint.activate([category.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 10),
                                     category.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16),
                                     category.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)])
        
        NSLayoutConstraint.activate([addCategory.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 10),
                                     addCategory.leadingAnchor.constraint(equalTo: category.trailingAnchor, constant: 5)])
        
        NSLayoutConstraint.activate([favorite.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 12),
                                     favorite.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16),
                                     favorite.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.2)])
        
        NSLayoutConstraint.activate([language.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -12),
                                     language.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([languageSelected.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -12),
                                     languageSelected.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16)])
        
        //Constraints das Notas
        
        NSLayoutConstraint.activate([notesView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 18),
                                     notesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     notesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                     notesView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)])
        
        NSLayoutConstraint.activate([notes.topAnchor.constraint(equalTo: notesView.topAnchor, constant: 18),
                                     notes.leadingAnchor.constraint(equalTo: notesView.leadingAnchor, constant: 16),
                                     notes.trailingAnchor.constraint(equalTo: notesView.trailingAnchor, constant: -16),
                                     notes.bottomAnchor.constraint(equalTo: notesView.bottomAnchor, constant: -18)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
