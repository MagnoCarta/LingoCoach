//
//  SwipingController.swift
//  LingoCoach
//
//  Created by Gilberto Magno on 12/2/20.
//

import UIKit

extension UserDefaults {
    static var isFirstLaunch: Bool {
        get {
            return !UserDefaults.standard.bool(forKey:"isNewUser")
        }
        set {
            UserDefaults.standard.set(true, forKey:"isNewUser")
        }
    }
    static var isNotFirstLaunch: Bool {
        get{
            isFirstLaunch = true
            return isFirstLaunch
        }
        set{
            UserDefaults.standard.set(true, forKey: "isNewUser")
        }
    }
    
}

class SwipingController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        self.view.addSubview(collection)
        collection.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        return collection
    }()
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }
            
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }) { (_) in
            
        }
        
    }
    
    let pages = [
        Page(imageName: "Ipad_1", headerText: "Hello and Welcome to LingoCoach!", otherText: "\n\nI see you are new here, so let me explain"),
        Page(imageName: "Ipad_2", headerText: "What is LingoCoach?", otherText: "\n\nIt is the app that aupport you in your language tasks"),
        Page(imageName: "Ipad_3", headerText: "What kind of task!?", otherText: "\n\nAny task or note that helps you learn faster and be more proactive"),
        
    ]
    
    let primeiroButton: UIButton = {
        let Button = UIButton(type: .system)
        Button.setTitle("ANTERIOR", for: .normal)
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        Button.setTitleColor(.gray, for: .normal)
        Button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return Button
    }()
    
    let segundoButton: UIButton = {
        let azulClaro = UIColor(red: 200/255, green: 50/255, blue: 33/255, alpha: 1)
        let Button = UIButton(type: .system)
        Button.setTitle("PRÓXIMO", for: .normal)
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        Button.setTitleColor(azulClaro, for: .normal)
        Button.addTarget(self, action: #selector(handlexNext), for: .touchUpInside)
        return Button
    }()
    
    lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.numberOfPages = pages.count
        control.currentPageIndicatorTintColor =  .mainRed
        
        control.pageIndicatorTintColor = .justRed
        return control
    }()
    
    func setUpButtonControls() {
        let bottomControlView = UIStackView(arrangedSubviews: [primeiroButton,pageControl, segundoButton])
        bottomControlView.distribution = .fillEqually
        bottomControlView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlView)
        NSLayoutConstraint.activate([
            bottomControlView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),bottomControlView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),bottomControlView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),bottomControlView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func handlexNext() {
        if pageControl.currentPage < pages.count - 1 {
            
            let nextIndex = min(pageControl.currentPage + 1,pageControl.numberOfPages - 1)
            pageControl.currentPage = nextIndex
            let indexPath = IndexPath(item: nextIndex, section: 0)
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        } else {
            
            dismiss(animated: true, completion: nil)
            let noteListVC = NoteListViewController()
            let progressVC = ProgressViewController()
            
            let navigationController = UINavigationController(rootViewController: noteListVC)

            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [navigationController, progressVC]
            tabBarController.tabBar.isHidden = true
            self.view.window?.rootViewController = UINavigationController(rootViewController: tabBarController)
            UserDefaults.isNotFirstLaunch = true
        }
    }
    
    @objc func handlePrev() {
        let nextIndex = max(pageControl.currentPage-1,0)
        pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    override func viewDidLayoutSubviews() {
        if !UserDefaults.isFirstLaunch {
            super.viewDidLayoutSubviews()
            let noteListVC = NoteListViewController()
            let progressVC = ProgressViewController()
            
            let navigationController = UINavigationController(rootViewController: noteListVC)

            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [navigationController, progressVC]
            tabBarController.tabBar.isHidden = true
            self.view.window?.rootViewController = UINavigationController(rootViewController: navigationController)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonControls()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
       // let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
       // view.addGestureRecognizer(gesture)
        
        setupConstraints()
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
//    @objc private func dismissKeyboard(_: UITextField) {
//        view.endEditing(true)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        if indexPath.item == 0{
            cell.pageID = 0
        }
        if indexPath.item == 2 {
            cell.pageID = 2
        }
        if indexPath.item == 1 {
            cell.pageID = 1
        }
        
        return cell
    }
}
extension SwipingController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
