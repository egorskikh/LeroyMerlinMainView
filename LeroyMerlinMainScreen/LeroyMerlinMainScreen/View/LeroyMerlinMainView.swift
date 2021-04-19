//
//  LeroyMerlinMainView.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 18.04.2021.
//

import UIKit

class LeroyMerlinMainView: UIView {
    
    static var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.addSubview(stackView)
        return scrollView
    }()
    
    static var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ catalogСollectionView,
                                                        limitSaleLbl,
                                                        limitSaleСollectionView,
                                                        bestSaleLbl,
                                                        bestSaleСollectionView
        ])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        
        return stackView
    }()
    
    static var catalogСollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    static var limitSaleLbl: UILabel = {
        let label = UILabel()
        label.text = "Best sale"
        label.textAlignment = .left
        return label
    }()
    
    static var limitSaleСollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    static var bestSaleLbl: UILabel = {
        let label = UILabel()
        label.text = "Best sale"
        label.textAlignment = .left
        return label
    }()
    
    static var bestSaleСollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    
    static func setupСatalogСollectionView() {
        NSLayoutConstraint.activate([
            LeroyMerlinMainView.catalogСollectionView.heightAnchor.constraint(equalToConstant: 130),
            LeroyMerlinMainView.limitSaleСollectionView.heightAnchor.constraint(equalToConstant: 130),
            LeroyMerlinMainView.bestSaleСollectionView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        self.setupCol()
    //    }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
}
