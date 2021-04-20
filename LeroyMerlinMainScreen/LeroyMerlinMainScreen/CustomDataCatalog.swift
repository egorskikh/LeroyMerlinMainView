//
//  CustomDataCatalog.swift
//  LeroyMerlinMainScreen
//
//  Created by Егор Горских on 20.04.2021.
//

import UIKit

struct CustomDataCatalog {
    var title: String
    var backgroundColor: UIColor
    var systemImage: UIImage?
    
    init (title: String, backgroundColor: UIColor, systemImage: String? = nil) {
        self.title = title
        self.backgroundColor = backgroundColor
        guard let image = systemImage else { return }
        self.systemImage = UIImage(systemName: image)
    }
}


