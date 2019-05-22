//
//  ListView.swift
//  Coding
//
//  Created by Tony Cheng on 5/22/19.
//  Copyright © 2019 Tony Cheng. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewDelegate: class {
    func didSelectViewController(viewController: CodingViewController)
}

class ListView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    weak var delegate: ListViewDelegate?
    var viewControllers: [CodingViewController] = []
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.reuseIdentifier())
        collectionView.backgroundColor = .white
        addSubview(collectionView)
        return collectionView
    }()
    
    convenience init(delegate: ListViewDelegate?, viewControllers: [CodingViewController]) {
        self.init(frame: .zero)
        
        backgroundColor = .white
        self.delegate = delegate
        self.viewControllers = viewControllers
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
    
    
    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.reuseIdentifier(), for: indexPath)
        if let listCell = cell as? ListCell {
            let text = viewControllers[indexPath.item].rawValue
            listCell.textLabel.text = text
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectViewController(viewController: viewControllers[indexPath.item])
    }
    
}
