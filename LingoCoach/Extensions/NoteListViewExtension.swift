//
//  NoteListViewExtension.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 11/25/20.
//

import Foundation
import UIKit

extension NoteListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        notasMockadas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let noteCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCollectionViewCell)
        
        noteCell.set(note: notasMockadas[indexPath.row])
        return noteCell
    }
    
}
