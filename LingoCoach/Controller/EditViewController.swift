//
//  EditViewController.swift
//  LingoCoach
//
//  Created by Vitor Bryan on 26/11/20.
//

import UIKit

class EditViewController: UIViewController {
    
    var note: Note!

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
    
    fileprivate let deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("Deletar Nota", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(deleteNote), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.2509803922, blue: 0.3333333333, alpha: 1)
        return button
    }()
    
    init(note: Note) {
        super.init(nibName: nil, bundle: nil)
        self.note = note
        self.titleField.text = note.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func saveNote() {
//        let context = UIApplication.shared.context

    }
    
    @objc func deleteNote() {
        let context = UIApplication.shared.context
        context.delete(self.note)
        do {
            try context.save()
        } catch {
            print("It was not possible to delete the note.")
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(saveNote))
        view.backgroundColor = .white
        view.addSubview(botView)
        view.addSubview(topView)
        view.addSubview(iconView)
        view.addSubview(icon)
        view.addSubview(titleView)
        view.addSubview(titleField)
        view.addSubview(editButton)
        view.addSubview(deleteButton)
        
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
                                     iconView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        NSLayoutConstraint.activate([icon.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 13),
                                     icon.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
//                                     icon.trailingAnchor.constraint(equalTo: iconView.trailingAnchor),
                                     icon.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.8),
                                     icon.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 0.8)])
        
        NSLayoutConstraint.activate([titleView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 16),
                                     titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)])
        
        NSLayoutConstraint.activate([titleField.topAnchor.constraint(equalTo: titleView.topAnchor),
                                     titleField.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 16),
                                     titleField.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -16),
                                     titleField.bottomAnchor.constraint(equalTo: titleView.bottomAnchor)])
        
        NSLayoutConstraint.activate([editButton.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 13),
                                     editButton.centerXAnchor.constraint(equalTo: iconView.centerXAnchor)])
        
        NSLayoutConstraint.activate([deleteButton.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 30),
                                     deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     deleteButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)])
    }
}
