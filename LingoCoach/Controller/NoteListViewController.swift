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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



