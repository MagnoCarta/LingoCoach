//
//  NoteListViewController.swift
//  LingoCoach
//
//  Created by Rodrigo Matos Aguiar on 24/11/20.
//

import UIKit

class NoteListViewController: UIViewController {
    
    var noteListView = NoteListView()
    var notes: [Note] = []
    
    override func loadView() {
        super.loadView()
        if let navigationBar = navigationController?.navigationBar {
            noteListView.addConstraintFilter(viewBar: navigationBar)
        }
        self.view = noteListView
    }
    
    override func viewDidLoad() {
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        load()
        
        super.viewDidLoad()
        self.title = "Notas"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = .navColor
        self.navigationItem.rightBarButtonItem = plusButton
        navigationController?.navigationBar.tintColor = .brightBlueNL
        self.view.backgroundColor = .background
        
        self.noteListView.delegate = self
        
        delegates(view: noteListView)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        noteListView.filterButton.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        load()
        noteListView.addConstraintFilter(viewBar: navigationController!.navigationBar)
    }
    
    @objc func addNote() {
        let context = UIApplication.shared.context
        let noteToAdd = Note(context: context.self)
        noteToAdd.icon = UIImage(named: "translate")
        noteToAdd.language = "Idioma"
        noteToAdd.title = "Nota \(notes.count+1)"
        do {
            try context.save()
        } catch {
            fatalError("")
        }
        notes.append(noteToAdd)
        noteListView.collectionView.reloadData()
    }
    
    func load() {
        let context = UIApplication.shared.context
        do {
            self.notes = try (context.fetch(Note.fetchRequest()) as! [Note])
        } catch {
            fatalError("Não foi possível carregar as notas.")
        }
        noteListView.collectionView.reloadData()
    }
    
    func delegates(view: NoteListView) {
        view.collectionView.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: "NoteCell")
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
    }
}

extension NoteListViewController: delegateFilter {
    func filterAction() {
        // navigationController?.pushViewController(FiltroViewController(), animated: true )
        
        let modalFilter = FilterViewController()
        modalFilter.modalPresentationStyle = .fullScreen
        modalFilter.backingImage = self.navigationController?.view.asImage()
        navigationController?.present(modalFilter, animated: false, completion: nil)
    }
    
}

extension NoteListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let noteCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCollectionViewCell)
        
        noteCell.set(note: self.notes[indexPath.row])
        noteCell.generateColor(row: indexPath.row)
        return noteCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailsViewController(note: notes[indexPath.row]), animated: true)
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
