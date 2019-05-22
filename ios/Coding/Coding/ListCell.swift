//
//  ListCell.swift
//  Coding
//
//  Created by Tony Cheng on 5/22/19.
//  Copyright © 2019 Tony Cheng. All rights reserved.
//

import Foundation
import UIKit

class ListCell: UICollectionViewCell {
    lazy var textLabel: UILabel = {
        let label = UILabel(frame: self.bounds)
        self.addSubview(label)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = bounds.insetBy(dx: 10, dy: 10)
    }
    
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
    
}
