//
//  ViewController.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 18.04.2021.
//

import UIKit

class LeroyMerlinVC: UIViewController, UISearchBarDelegate {
    // MARK: - Property
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        searchController.searchBar.delegate = self
        setupAddSubview()
        setupStackViewConstraint()
        setupScrollViewConstraint()
        setupNavigationController()
        setupSearchBar()
        setupCustomSearchBarItem()
        
    }
    
    
    func updateSelectedState() {
       
    }
    
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Product search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false // del leter
        navigationController?.navigationBar.backgroundColor = .green
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func setupSearchBar() {
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.searchTextField.backgroundColor = .white
        }
    
    private func setupCustomSearchBarItem() {
        searchController.searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .bookmark, state: .normal)
        
        customCancelBtn()
    }
    
    private func customCancelBtn() {
        searchController.searchBar.showsCancelButton = true
        if let cancelButton = searchController.searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setImage(UIImage(systemName: "barcode.viewfinder"), for: .normal)
            cancelButton.setTitle("", for: .normal)
            cancelButton.backgroundColor = .white
            cancelButton.tintColor = .gray
        }
    }
    
    // MARK: - Setup Constraint
    
    private func setupAddSubview() {
      view.addSubview(LeroyMerlinMainView.scrollView)
    }
    
    private func setupScrollViewConstraint() {
        let frameLayoutGuide = LeroyMerlinMainView.scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupStackViewConstraint() {
        let contentLayoutGuide = LeroyMerlinMainView.scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            LeroyMerlinMainView.stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            LeroyMerlinMainView.stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            LeroyMerlinMainView.stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            LeroyMerlinMainView.stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            LeroyMerlinMainView.stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
        
        LeroyMerlinMainView.setupСatalogСollectionView()
    }
    
}

//extension LeroyMerlinVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        3
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return UICollectionViewCell()
//    }
//    
//    
//}
