//
//  LeroyMerlinView.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 21.04.2021.
//

import UIKit

class LeroyMerlinView: UIView {

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
        collectionView.showsHorizontalScrollIndicator = false
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
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
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
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
}
