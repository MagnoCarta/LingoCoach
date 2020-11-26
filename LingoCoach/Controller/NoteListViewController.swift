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
        if let navigationBar = navigationController?.navigationBar  {
            noteListView.addConstraintFilter(viewBar: navigationBar)
        }
        self.view = noteListView
    }
    
    override func viewDidLoad() {
        do {
            let notes = try (context.fetch(Note.fetchRequest()) as! [Note])
            self.notes = notes
        }catch {
            fatalError("em fase de testes")
        }
        let notaMockada = Note(context: context.self)
        notaMockada.icon = UIImage(systemName: "Trash")
        notaMockada.language = "ingles"
        notaMockada.title = "Teste titulo"
        notes.append(notaMockada)
        
        super.viewDidLoad()
        self.title = "Notas"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = plusButton
        self.navigationItem.rightBarButtonItem?.tintColor = .brightGreenLC
        self.view.backgroundColor = .white
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



