//
//  PageCell.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 12/2/20.
//


import UIKit
class PageCell : UICollectionViewCell {
    var page: Page? {
            didSet {
                guard let unwrappedPage = page else {return}
                let atributtedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
                atributtedText.append(NSAttributedString(string:unwrappedPage.otherText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.gray]))
                primeiraImageView.image = UIImage(named: unwrappedPage.imageName)
                primeiroTexto.attributedText = atributtedText
                primeiroTexto.textAlignment = .center
            }
        }
        let primeiraImageView: UIImageView = {
          let imageView = UIImageView(image: UIImage(named: "Ipad_1"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        public let primeiroTexto: UITextView = {
                    let texto1 = UITextView()
                    let atributtedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
                    atributtedText.append(NSAttributedString(string: "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.gray]))
                    texto1.attributedText = atributtedText
                    texto1.translatesAutoresizingMaskIntoConstraints = false
                    texto1.textAlignment = .center
                    texto1.isEditable = false
                    texto1.isScrollEnabled = false
                    return texto1
                }()
        var pageID: Int = 0
        var primeiroTextFilBottomConstraint: NSLayoutConstraint!
        var originalConstantBottom: CGFloat = -190
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .white
           // setUpTextFil()
            self.addSubview(primeiraImageView)
            configure()
            setupObservers()
        }
        private func setupObservers() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardDissapeared), name: UIResponder.keyboardWillHideNotification, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        }
        @objc private func keyboardWillAppear(notification: Notification) {
            let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            UIView.animate(withDuration: 1) {
                self.primeiroTextFilBottomConstraint.constant = self.originalConstantBottom - keyboardSize.height
                self.layoutIfNeeded()
            }
        }
        
        @objc private func keyboardDissapeared() {
            UIView.animate(withDuration: 1) {
                self.primeiroTextFilBottomConstraint.constant = self.originalConstantBottom
                self.layoutIfNeeded()
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure() {
                addSubview(primeiroTexto)
            primeiraImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
             NSLayoutConstraint.activate([primeiraImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
             primeiraImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
             primeiraImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            primeiroTexto.topAnchor.constraint(equalTo: primeiraImageView.bottomAnchor, constant: 20),
                primeiroTexto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                primeiroTexto.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
             ])
            }
}
