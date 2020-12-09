//
//  iconViewController.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 12/8/20.
//

import Foundation
import UIKit


class IconViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let iconCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath) as! IconCollectionViewCell)
        
        iconCell.set(icon: UIImage(named:self.icons[indexPath.row])!)
        return iconCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.hasChangedIcon(image: UIImage(named: icons[indexPath.row])!)
        dismiss(animated: true, completion: nil)
    }
    var myIconView = MyIconView()
    var icons = ["translate","translate-chinese","translate-greek","translate-japanese","translate-latin","translate-russian"]
    weak var delegate : IconViewControllerDelegate!
    
    override func loadView() {
        super.loadView()
        
        view = myIconView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Escolha seu novo icone"
        delegates(view: myIconView)
    }
    
    
    func delegates(view: MyIconView) {
        view.collectionView.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: "IconCell")
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
    }
}


extension IconViewController {
    
    
}
