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
    var notasMockadas: [Note] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func loadView() {
        super.loadView()
        if let navigationBar = navigationController?.navigationBar  {
            noteListView.addConstraintFilter(viewBar: navigationBar)
        }
        
        self.view = noteListView
        
        
    }
    
    override func viewDidLoad() {
        let note = Note(context: self.context)
        note.icon = UIImage(systemName: "trash")
        note.language = "Inglês"
        note.title = "Aprender verbo to be"
        notasMockadas.append(note)
        notasMockadas.append(note)
        notasMockadas.append(note)
        notasMockadas.append(note)
        notasMockadas.append(note)
        notasMockadas.append(note)
        
        super.viewDidLoad()
        self.title = "Notas"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = plusButton
        self.navigationItem.rightBarButtonItem?.tintColor = .brightGreenLC
        self.view.backgroundColor = .white
        
        self.noteListView.delegate = self
        
        delegates(view: noteListView)
        
        // Do any additional setup after loading the view.
    }
    @objc func addNote() {
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
