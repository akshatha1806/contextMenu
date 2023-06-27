//
//  languagesCollectionViewCell.swift
//  ContextMenu
//
//  Created by Akshatha on 27/06/23.
//

import UIKit

class languagesCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var languageName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        dataView.addShadow()
    }

}
