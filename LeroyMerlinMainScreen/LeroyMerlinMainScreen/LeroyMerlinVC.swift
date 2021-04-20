//
//  ViewController.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 18.04.2021.
//

import UIKit

class LeroyMerlinVC: UIViewController {
    
    // MARK: - CatalogData
    
    fileprivate let catalogData = [ CustomDataCatalog(title: "Catalog", backgroundColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),
                                                      systemImage: "list.bullet"),
                                    CustomDataCatalog(title: "Garden", backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
                                    CustomDataCatalog(title: "Lighting", backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
                                    CustomDataCatalog(title: "Instruments", backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
                                    CustomDataCatalog(title: "Building materials", backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
                                    CustomDataCatalog(title: "Decor", backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]
    
    fileprivate let limitData = [CustomDataLimit(imageView: #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), titleName: "Saw", titleSale: "5,45$"),
                                 CustomDataLimit(imageView: #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1), titleName: "Hammer", titleSale: "4,41$"),
                                 CustomDataLimit(imageView: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), titleName: "Stucco", titleSale: "5,45$"),
                                 CustomDataLimit(imageView: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), titleName: "Drywall", titleSale: "15,44$"),
                                 CustomDataLimit(imageView: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), titleName: "Paint", titleSale: "10,00$"),
                                 CustomDataLimit(imageView: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), titleName: "Concrete", titleSale: "3,44$"),
                                 CustomDataLimit(imageView: #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), titleName: "Bucket", titleSale: "2,50$"),
                                 CustomDataLimit(imageView: #colorLiteral(red: 0.4922404289, green: 0.7722371817, blue: 0.4631441236, alpha: 1), titleName: "Rake", titleSale: "3,00$")]
    
    fileprivate let bestData = [CustomDataBest(imageView: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), titleName: "Saw", titleSale: "5,45$"),
                                CustomDataBest(imageView: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), titleName: "Hammer", titleSale: "4,41$"),
                                CustomDataBest(imageView: #colorLiteral(red: 0.7464011312, green: 0.8857318759, blue: 0.7402122021, alpha: 1), titleName: "Stucco", titleSale: "5,45$"),
                                CustomDataBest(imageView: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleName: "Drywall", titleSale: "15,44$"),
                                CustomDataBest(imageView: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), titleName: "Paint", titleSale: "10,00$"),
                                CustomDataBest(imageView: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), titleName: "Concrete", titleSale: "3,44$"),
                                CustomDataBest(imageView: #colorLiteral(red: 0.4922404289, green: 0.7722371817, blue: 0.4631441236, alpha: 1), titleName: "Bucket", titleSale: "2,50$"),
                                CustomDataBest(imageView: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), titleName: "Rake", titleSale: "3,00$")]
    
    
    
    // MARK: - Property
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.addSubview(stackView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceHorizontal = false
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
        collectionView.register(CatalogCell.self, forCellWithReuseIdentifier: "CatalogCell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var limitSaleLbl: UILabel = {
        let label = UILabel()
        label.attributedText =
            NSMutableAttributedString()
                .bold("Limit sale")
        label.textAlignment = .left
        return label
    }()
    
    lazy var limitSaleСollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LimitCell.self, forCellWithReuseIdentifier: "LimitCell")
        collectionView.backgroundColor = .white // del leter
        return collectionView
    }()
    
    lazy var bestSaleLbl: UILabel = {
        let label = UILabel()
        label.attributedText =
            NSMutableAttributedString()
                .bold("Best sale")
        label.textAlignment = .left
        return label
    }()
    
    lazy var bestSaleСollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BestCell.self, forCellWithReuseIdentifier: "BestCell")
        collectionView.backgroundColor = .white
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
        setupCollectionsViewsProtocols()     
    }
    
    
    func setupCollectionsViewsProtocols() {
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
            cancelButton.clipsToBounds = true
            cancelButton.layer.cornerRadius = 5
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
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            frameLayoutGuide.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setupStackViewConstraint() {
        setupСollectionViews()
        let contentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -5),
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor, constant: 5)
        ])
    }
    
    private func setupСollectionViews() {
        NSLayoutConstraint.activate([
            catalogСollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2),
            limitSaleСollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2),
            bestSaleСollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2)
        ])
        
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension LeroyMerlinVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == catalogСollectionView {
            return catalogData.count
        }
        if collectionView == limitSaleСollectionView {
            return limitData.count
        }
        if collectionView == bestSaleСollectionView {
            return bestData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // catalogСollectionView
        if collectionView == catalogСollectionView {
            guard
                let catalogCell = catalogСollectionView.dequeueReusableCell(withReuseIdentifier: "CatalogCell", for: indexPath) as? CatalogCell
            else {
                return UICollectionViewCell()
            }
            catalogCell.dataCatalog = self.catalogData[indexPath.item]
            return catalogCell
        }
        
        // limitSaleСollectionView
        if collectionView == limitSaleСollectionView {
            guard
                let limitCell = limitSaleСollectionView.dequeueReusableCell(withReuseIdentifier: "LimitCell", for: indexPath) as? LimitCell
            else {
                return UICollectionViewCell()
            }
            limitCell.dataLimit = self.limitData[indexPath.item]
            return limitCell
        }
        
        // BestSale СollectionView
        if collectionView == bestSaleСollectionView {
            guard
                let bestCell = bestSaleСollectionView.dequeueReusableCell(withReuseIdentifier: "BestCell", for: indexPath) as? BestCell
            else {
                return UICollectionViewCell()
            }
            bestCell.dataBest = self.bestData[indexPath.item]
            return bestCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Сatalog СollectionView
        if collectionView == catalogСollectionView {
            return CGSize(width: (catalogСollectionView.frame.width / 2.5), height: (catalogСollectionView.frame.width / 2.5))
        }
        // LimitSale СollectionView
        if collectionView == limitSaleСollectionView {
            return CGSize(width: limitSaleСollectionView.frame.width / 2.5,
                          height: limitSaleСollectionView.frame.width / 2)
        }
        // BestSale СollectionView
        if collectionView == bestSaleСollectionView {
            return CGSize(width: bestSaleСollectionView.frame.width / 2.5,
                          height: bestSaleСollectionView.frame.width / 2)
        }
        return CGSize(width: 0, height: 0)
    }
    
}


