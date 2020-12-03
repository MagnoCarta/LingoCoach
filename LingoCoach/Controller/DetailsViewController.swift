//
//  DetailsViewController.swift
//  LingoCoach
//
//  Created by Vitor Bryan on 24/11/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
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
    
    fileprivate let content: Description = {
        let content = Description()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    @objc func editScreen() {
        let nextVC = EditViewController(note: note)
        nextVC.delegate = self
        let navController = UINavigationController(rootViewController: nextVC)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 60
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    init(note: Note) {
        super.init(nibName: nil, bundle: nil)
        self.note = note
        content.delegate = self
        content.icon.image = note.icon
        content.languageSelected.text = note.language
        
        if note.summary != nil && note.summary != " " {
            content.notes.text = note.summary
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = note.title
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Editar", style: .plain, target: self, action: #selector(editScreen))
        view.backgroundColor = .background
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(botView)
        view.addSubview(topView)
        view.addSubview(content)
        
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.098).isActive = true
        
        botView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        botView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        botView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        botView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        content.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: botView.topAnchor).isActive = true
        content.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if content.notes.isFirstResponder {
            content.dismissKeyboard()
        }
    }
    
}

extension DetailsViewController: DescriptionDelegate {
    func changeDescription(description: String) {
        let context = UIApplication.shared.context
        note.summary = description
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

extension DetailsViewController: EditViewControllerDelegate {
    func hasSavedNote() {
        navigationItem.title = note.title
    }
    
    func hasDeletedNote() {
        navigationController?.popViewController(animated: false)
    }
}
