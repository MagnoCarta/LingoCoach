//
//  EditViewController.swift
//  LingoCoach
//
//  Created by Vitor Bryan on 26/11/20.
//

import UIKit

class EditViewController: UIViewController {

    fileprivate let botView: UIView = {
        let botView = UIView()
        botView.translatesAutoresizingMaskIntoConstraints = false
        return botView
    }()
    
    fileprivate let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
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
    
    fileprivate let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = #colorLiteral(red: 0.909702003, green: 0.9098611474, blue: 0.9097036719, alpha: 1)
        return view
    
    }()
    
    let titleField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Sem Título"
        text.textColor = .black
        return text
    
    }()
    
    fileprivate let editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("Editar Ícone", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(#colorLiteral(red: 0.09411764706, green: 0.3882352941, blue: 0.3764705882, alpha: 1), for: .normal)
//        button.backgroundColor = #colorLiteral(red: 0.001636183239, green: 0.7755811214, blue: 0.6421516538, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(botView)
        view.addSubview(topView)
        view.addSubview(iconView)
        view.addSubview(icon)
        view.addSubview(titleView)
        view.addSubview(titleField)
        view.addSubview(editButton)
        
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.098).isActive = true
        
        botView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        botView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        botView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        botView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        NSLayoutConstraint.activate([iconView.widthAnchor.constraint(equalToConstant: 120),
                                     iconView.heightAnchor.constraint(equalToConstant: 120),
                                     iconView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 30),
                                     iconView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 127.5)])
        
        NSLayoutConstraint.activate([icon.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 13),
                                     icon.leadingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: 12),
//                                     icon.trailingAnchor.constraint(equalTo: iconView.trailingAnchor),
                                     icon.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.8),
                                     icon.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 0.8)])
        
        NSLayoutConstraint.activate([titleView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 16),
                                     titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)])
        
        NSLayoutConstraint.activate([titleField.topAnchor.constraint(equalTo: titleView.topAnchor),
                                     titleField.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 16),
                                     titleField.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -16),
                                     titleField.bottomAnchor.constraint(equalTo: titleView.bottomAnchor)])
        
        NSLayoutConstraint.activate([editButton.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 13),
                                     editButton.leadingAnchor.constraint(equalTo: iconView.leadingAnchor),
                                     editButton.trailingAnchor.constraint(equalTo: iconView.trailingAnchor)])
    }
}
