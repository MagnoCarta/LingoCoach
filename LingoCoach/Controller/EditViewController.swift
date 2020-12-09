//
//  EditViewController.swift
//  LingoCoach
//
//  Created by Vitor Bryan on 26/11/20.
//

import UIKit

class EditViewController: UIViewController, ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        icon.image = image
        
    }
    
    var imagePicker: ImagePicker!
    var note: Note!
    weak var delegate: EditViewControllerDelegate!
    
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
        view.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.3137254902, blue: 0.5490196078, alpha: 1)
        view.layer.cornerRadius = 8
        return view
        
    }()
    
    fileprivate let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .foreground
        return view
        
    }()
    
    let titleField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Sem Título"
        text.textColor = .textBlack
        return text
        
    }()
    
    fileprivate let editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("Editar Ícone", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.brightBlueNL, for: .normal)
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
        note.icon = icon.image
        let context = UIApplication.shared.context
        note.title = titleField.text
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
        delegate.hasSavedNote()
    }
    
    @objc func dismisssKeyboard(_ sender: UITapGestureRecognizer) {
        titleField.resignFirstResponder()
        
    }
    
    @objc func deleteNote() {
        let alert = UIAlertController(title: "Deletar Nota?", message: "Essa nota será excluído permanentemente.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: { action in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: "Deletar", style: .destructive, handler: { action in
            let context = UIApplication.shared.context
            context.delete(self.note)
            do {
                try context.save()
            } catch {
                print("It was not possible to delete the note.")
            }
            self.dismiss(animated: true, completion: nil)
            self.delegate.hasDeletedNote()
        }))
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        editButton.addAction(UIAction(handler: { (_) in
            let iconVC = IconViewController()
            iconVC.delegate = self
            let navController = UINavigationController(rootViewController: iconVC)
            self.navigationController?.present(navController, animated: true, completion: nil)
            
        }), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismisssKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(saveNote))
        navigationController?.navigationBar.tintColor = .brightBlueNL
        navigationController?.navigationBar.barTintColor = .navColor
        navigationItem.title = "Editar Nota"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelNoteChanges))
        view.backgroundColor = .background
        setupViews()
    }
    @objc func cancelNoteChanges() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews() {
        icon.image = self.note.icon
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
        
        NSLayoutConstraint.activate([icon.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
                                     icon.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
                                     //                                     icon.trailingAnchor.constraint(equalTo: iconView.trailingAnchor),
                                     icon.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.65),
                                     icon.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 0.65)])
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

extension EditViewController: IconViewControllerDelegate {
    func hasChangedIcon(image: UIImage) {
        icon.image = image
    }

}
