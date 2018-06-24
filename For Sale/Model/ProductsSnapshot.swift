//
//  ProductsSnapshot.swift
//  For Sale
//
//  Created by Manohar Kurapati on 23/06/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//

import Foundation
import Firebase

struct ProductSnapshot {
    let products: [Product]
    
    init?(snapshot: DataSnapshot){
        guard let snapDict = snapshot.value as? [String:[String: Any]] else { return nil }
        
        var products = [Product]()
        for snap in snapDict {
            guard let product = Product(valueDict: snap.value) else { continue }
            products.append(product)
        }
        self.products = products
    }
}
