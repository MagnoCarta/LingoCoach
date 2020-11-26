//
//  NoteListViewController.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 24/11/20.
//

import UIKit

class NoteListViewController: UIViewController {
    var plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
    var noteListView = NoteListView()
    var notes: [Note] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func loadView() {
        super.loadView()
        if let navigationBar = navigationController?.navigationBar {
            noteListView.addConstraintFilter(viewBar: navigationBar)
        }
        self.view = noteListView
    }
    
    override func viewDidLoad() {
        do {
            self.notes = try (context.fetch(Note.fetchRequest()) as! [Note])
        } catch {
            fatalError("Não foi possível carregar as notas.")
        }
        let notaMockada = Note(context: context.self)
        notaMockada.icon = UIImage(systemName: "Trash")
        notaMockada.language = "ingles"
        notaMockada.title = "Teste titulo"
        notes.append(notaMockada)
        notes.append(notaMockada)
        notes.append(notaMockada)
        notes.append(notaMockada)
        
        super.viewDidLoad()
        self.title = "Notas"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = plusButton
        self.navigationItem.rightBarButtonItem?.tintColor = .brightGreenLC
        self.view.backgroundColor = .background
        
        delegates(view: noteListView)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        noteListView.filterButton.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        noteListView.addConstraintFilter(viewBar: navigationController!.navigationBar)
    }
    
    @objc func addNote() {
        
    }
    
    func delegates(view: NoteListView) {
        view.collectionView.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: "NoteCell")
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
    }

}

extension NoteListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        self.notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let noteCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCollectionViewCell)
        
        noteCell.set(note: self.notes[indexPath.row])
        return noteCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailsViewController(), animated: true)
       
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let numberOfItemsPerRow:CGFloat = 4
//            let spacingBetweenCells:CGFloat = 16
//
//            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
//
//            if let collection = self.collectionView{
//                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//                return CGSize(width: width, height: width)
//            }else{
//                return CGSize(width: 0, height: 0)
//            }
//        }
}
