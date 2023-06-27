//
//  CustomView.swift
//  ContextMenu
//
//  Created by Akshatha on 27/06/23.
//

import Foundation
import UIKit
class CustomGridThreeCollectionViewLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    override var itemSize: CGSize {
        get {
            // Setting the number of coloumns for collectionView.
            let numberOfColumns: CGFloat = 3
            let itemWidth = (self.collectionView?.frame.width)!/numberOfColumns
            return CGSize(width: itemWidth - 10, height: itemWidth + 8)
        }
        set { _ = newValue }
    }
    func setupLayout() {
        minimumInteritemSpacing = 10 // Setting item spacing.
        minimumLineSpacing = 10 // Setting line spacing.
        scrollDirection = .vertical // Setting scroll direction.
    }
}
