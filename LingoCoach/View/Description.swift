//
//  Description.swift
//  LingoCoach
//
//  Created by Vitor Bryan on 24/11/20.
//

import UIKit

class Description: UIView, UIGestureRecognizerDelegate, UITextViewDelegate {
    
    weak var delegate: DescriptionDelegate!
    
//    let categories = [""]
    var descriptionFields: [UIView]!
    
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

    fileprivate let descriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .foreground
        return view
    }()
    
    fileprivate let notesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .foreground
        return view
    }()
    
    fileprivate let category: UILabel = {
        let text = UILabel()
        text.text = "Categoria"
        text.textColor = .textBlack
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
        
    }()
    
    let categorySelected: UITextField = {
        let text = UITextField()
        text.placeholder = "Informe a categoria"
        text.textColor = .textBlack
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
        
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
        text.textColor = .textBlack
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
        
    }()
    
    let languageSelected: UITextField = {
        let text = UITextField()
        text.placeholder = "Informe o idioma"
        text.textColor = .textBlack
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return text
        
    }()
    
    let notes: UITextView = {
        let text = UITextView.init()
        text.text = "Digite suas anotações aqui"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .lightGray
//        text.text = "Digite suas anotações aqui.."
//        text.textColor = UIColor.lightGray
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.backgroundColor = .clear
        return text
    
    }()

//    func registerTap() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//
//        tap.delegate = self
//        notes.isUserInteractionEnabled = true
//        notes.addGestureRecognizer(tap)
//
//    }
//
//    @objc func handleTap(sender: UITapGestureRecognizer) {
//        let sentTextView = sender.view as? UITextView
//
//        if let notes = sentTextView {
//            let layoutManager = notes.layoutManager
//            var location = sender.location(in: sentTextView)
//
//            location.x -= notes.textContainerInset.left
//            location.y -= notes.textContainerInset.top
//
//            let characterIndex = layoutManager.characterIndex(for: location, in: notes.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
//            guard let text = notes.text else { return }
//
//            if characterIndex < notes.textStorage.length {
//
//            }
//        }
//    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.frame.origin.y == 0 {
                self.frame.origin.y -= keyboardSize.height - 80
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.frame.origin.y != 0 {
            self.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboardIfNeeded() {
        let frFields = descriptionFields.filter {$0.isFirstResponder}
        if let frField = frFields.first {
            frField.resignFirstResponder()
            //Metodo de salvar aqui
            delegate.changeNote()
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Digite suas anotações aqui" && textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .textBlack
        
        }
        textView.becomeFirstResponder()
        
//        if textView.isFirstResponder {
//            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Digite suas anotações aqui"
            textView.textColor = .lightGray
            
        }
        textView.resignFirstResponder()
        
//        if !textView.isFirstResponder {
//            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.descriptionFields = [notes, languageSelected, categorySelected]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboardIfNeeded))
        self.addGestureRecognizer(tapGesture)
        
        backgroundColor = .background
        addSubview(iconView)
        addSubview(icon)
        addSubview(descriptionView)
        addSubview(notesView)
        addSubview(category)
        addSubview(categorySelected)
//        addSubview(favorite)
        addSubview(language)
        addSubview(languageSelected)
        addSubview(notes)
        //Constraints da Descrição
        
        NSLayoutConstraint.activate([iconView.widthAnchor.constraint(equalToConstant: 120),
                                     iconView.heightAnchor.constraint(equalToConstant: 120),
                                     iconView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                                     iconView.centerXAnchor.constraint(equalTo: centerXAnchor)])
        
        NSLayoutConstraint.activate([icon.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
                                     icon.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
//                                     icon.trailingAnchor.constraint(equalTo: iconView.trailingAnchor),
                                     icon.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.65),
                                     icon.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 0.65)])
        
        NSLayoutConstraint.activate([descriptionView.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 26),
                                     descriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     descriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                     descriptionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.14)])
        
        NSLayoutConstraint.activate([category.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 12),
                                     category.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([categorySelected.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 12),
                                     categorySelected.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16)])
        
//        NSLayoutConstraint.activate([favorite.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 12),
//                                     favorite.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16),
//                                     favorite.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.2)])
        
        NSLayoutConstraint.activate([language.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -12),
//                                     language.topAnchor.constraint(equalTo: category.bottomAnchor, constant: 10),
                                     language.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16)])
        
        NSLayoutConstraint.activate([languageSelected.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -12),
//                                     languageSelected.topAnchor.constraint(equalTo: category.bottomAnchor, constant: 10),
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
        
        notes.delegate = self
        
//        category.delegate = self
//        category.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension Description: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: category.frame.width/1.5, height: category.frame.height/3)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryViewCell
//        return cell
//    }
//
//}
