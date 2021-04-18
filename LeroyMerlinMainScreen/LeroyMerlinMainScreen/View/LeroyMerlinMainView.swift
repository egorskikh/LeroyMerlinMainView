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
        let stackView = UIStackView(arrangedSubviews: [bestSaleLbl
                                                       ])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        
        return stackView
    }()
    
    static var bestSaleLbl: UILabel = {
        let label = UILabel()
        label.text = "Best sale"
        label.textAlignment = .center
        return label
    }()

    
    

}
