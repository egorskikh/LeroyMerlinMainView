//
//  ViewController.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 18.04.2021.
//

import UIKit

class LeroyMerlinVC: UIViewController {
    // MARK: - Property
    
    let searchController = UISearchController(searchResultsController: nil)
 
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        setupNavigationController()
        setupSearchBar()
        setupCustomSearchBarItem()
        setupAddSubview()
        setupStackViewConstraint()
        setupScrollViewConstraint()
    }
    

    // MARK: - Action
    
    @objc func barButtonItemDidTapped() {
        print(#function)
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
        searchController.searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .bookmark, state: .normal)
        searchController.searchBar.showsBookmarkButton = true
     //   customBookmarkBtn()
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
    
    private func customBookmarkBtn() {
        searchController.searchBar.showsBookmarkButton = true
        if let bookmarkButton = searchController.searchBar.value(forKey: "bookmarkButton") as? UIButton { // Error in "bookmark"
            bookmarkButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            bookmarkButton.setTitle("", for: .normal)
            bookmarkButton.backgroundColor = .green
            bookmarkButton.tintColor = .white
            
        }
    }
    
    private func setupCustomNavigationControllerItem() {
        
    }
    
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
    }
    
}

