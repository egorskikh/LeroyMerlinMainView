//
//  LeroyMerlinMainView.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 18.04.2021.
//

import UIKit

class CatalogCell: UICollectionViewCell {
    
    var dataCatalog: CustomDataCatalog? {
        didSet {
            guard let data = dataCatalog  else { return }
            view.backgroundColor = data.backgroundColor
            label.text = data.title
            image.tintColor = .white
            image.image = data.systemImage
        }
    }
    
    fileprivate let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupAddSubview()
        setupCellConstraint()
        setupLabelConstraint()
        setupImageViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAddSubview() {
        contentView.addSubview(view)
        view.addSubview(label)
        view.addSubview(image)
    }
    
    func setupCellConstraint(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupLabelConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ])
    }
    
    func setupImageViewConstraint() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50),
            
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            image.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 5),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
}
