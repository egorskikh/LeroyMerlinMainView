//
//  ViewController.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 18.04.2021.
//

import UIKit

final class LeroyMerlinVC: UIViewController {
    
    // MARK: - Data
    
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
    private let searchController = UISearchController(searchResultsController: nil)
    private let lmv = LeroyMerlinView()
    
    
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
    
    
    private func setupCollectionsViewsProtocols() {
        lmv.catalogСollectionView.dataSource = self
        lmv.catalogСollectionView.delegate = self
        
        lmv.limitSaleСollectionView.dataSource = self
        lmv.limitSaleСollectionView.delegate = self
        
        lmv.bestSaleСollectionView.dataSource = self
        lmv.bestSaleСollectionView.delegate = self
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
        view.addSubview(lmv.scrollView)
    }
    
    private func setupScrollViewConstraint() {
        let frameLayoutGuide = lmv.scrollView.frameLayoutGuide
        NSLayoutConstraint.activate([
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    private func setupStackViewConstraint() {
        setupСollectionViews()
        let contentLayoutGuide = lmv.scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            lmv.stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 5),
            lmv.stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -5),
            lmv.stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor, constant: 5),
            lmv.stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor, constant: 5),
            lmv.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
    
    private func setupСollectionViews() {
        NSLayoutConstraint.activate([
            lmv.catalogСollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2),
            lmv.limitSaleСollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2),
            lmv.bestSaleСollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2)
        ])
        
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension LeroyMerlinVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == lmv.catalogСollectionView {
            return catalogData.count
        }
        if collectionView == lmv.limitSaleСollectionView {
            return limitData.count
        }
        if collectionView == lmv.bestSaleСollectionView {
            return bestData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // catalogСollectionView
        if collectionView == lmv.catalogСollectionView {
            guard
                let catalogCell = lmv.catalogСollectionView.dequeueReusableCell(withReuseIdentifier: "CatalogCell", for: indexPath) as? CatalogCell
            else {
                return UICollectionViewCell()
            }
            catalogCell.dataCatalog = self.catalogData[indexPath.item]
            return catalogCell
        }
        
        // limitSaleСollectionView
        if collectionView == lmv.limitSaleСollectionView {
            guard
                let limitCell = lmv.limitSaleСollectionView.dequeueReusableCell(withReuseIdentifier: "LimitCell", for: indexPath) as? LimitCell
            else {
                return UICollectionViewCell()
            }
            limitCell.dataLimit = self.limitData[indexPath.item]
            return limitCell
        }
        
        // BestSale СollectionView
        if collectionView == lmv.bestSaleСollectionView {
            guard
                let bestCell = lmv.bestSaleСollectionView.dequeueReusableCell(withReuseIdentifier: "BestCell", for: indexPath) as? BestCell
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
        if collectionView == lmv.catalogСollectionView {
            return CGSize(width: (lmv.catalogСollectionView.frame.width / 2.5), height: (lmv.catalogСollectionView.frame.width / 2.5))
        }
        // LimitSale СollectionView
        if collectionView == lmv.limitSaleСollectionView {
            return CGSize(width: lmv.limitSaleСollectionView.frame.width / 2.5,
                          height: lmv.limitSaleСollectionView.frame.width / 2)
        }
        // BestSale СollectionView
        if collectionView == lmv.bestSaleСollectionView {
            return CGSize(width: lmv.bestSaleСollectionView.frame.width / 2.5,
                          height: lmv.bestSaleСollectionView.frame.width / 2)
        }
        return CGSize(width: 0, height: 0)
    }
    
}


