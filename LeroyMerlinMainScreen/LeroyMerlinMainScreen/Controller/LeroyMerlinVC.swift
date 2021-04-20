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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.addSubview(stackView)
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ catalogСollectionView,
                                                        limitSaleLbl,
                                                        limitSaleСollectionView,
                                                        bestSaleLbl,
                                                        bestSaleСollectionView
        ])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var catalogСollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CatalogCell")
        collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    lazy var limitSaleLbl: UILabel = {
        let label = UILabel()
        label.text = "Limit sale"
        label.textAlignment = .left
        return label
    }()
    
    lazy var limitSaleСollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "LimitCell")
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    lazy var bestSaleLbl: UILabel = {
        let label = UILabel()
        label.text = "Best sale"
        label.textAlignment = .left
        return label
    }()
    
    lazy var bestSaleСollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BestCell")
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        setupAddSubview()
        setupStackViewConstraint()
        setupScrollViewConstraint()
        setupNavigationController()
        setupSearchBar()
        setupCustomSearchBarItem()
        setupCollectionsViews()
    }
    
    
    func setupCollectionsViews() {
        catalogСollectionView.dataSource = self
        catalogСollectionView.delegate = self
        limitSaleСollectionView.dataSource = self
        limitSaleСollectionView.delegate = self
        bestSaleСollectionView.dataSource = self
        bestSaleСollectionView.delegate = self
    }
    
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = "Product search"
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
        view.addSubview(scrollView)
    }
    
    private func setupScrollViewConstraint() {
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupStackViewConstraint() {
        setupСollectionViews()
        let contentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
        
        
    }
    
    private func setupСollectionViews() {
        NSLayoutConstraint.activate([
            catalogСollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            limitSaleСollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            bestSaleСollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2)
        ])
        
    }
}

// MARK: - catalogСollectionView - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension LeroyMerlinVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == catalogСollectionView {
            return 1
        }
        
        if collectionView == limitSaleСollectionView {
            return 2
        }
        
        if collectionView == bestSaleLbl {
            return 3
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == catalogСollectionView {
            let catalogCell = catalogСollectionView.dequeueReusableCell(withReuseIdentifier: "CatalogCell", for: indexPath)
            catalogCell.backgroundColor = .white
            return catalogCell
        }
        
        if collectionView == limitSaleСollectionView {
            let limitCell = limitSaleСollectionView.dequeueReusableCell(withReuseIdentifier: "LimitCell", for: indexPath)
            limitCell.backgroundColor = .gray
            return limitCell
        }
        
        if collectionView == bestSaleСollectionView {
            let bestCell = limitSaleСollectionView.dequeueReusableCell(withReuseIdentifier: "BestCell", for: indexPath)
            bestCell.backgroundColor = .blue
            return bestCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.height / 2.5)
    }
    
    
}


