//
//  ProductCell.swift
//  For Sale
//
//  Created by Manohar Kurapati on 22/06/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(with product: Product){
        titleLabel.text = product.title
        priceLabel.text = product.price()
    }
    
}
