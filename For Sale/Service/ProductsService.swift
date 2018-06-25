//
//  ProductsService.swift
//  For Sale
//
//  Created by Manohar Kurapati on 25/06/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate{
    func didChange(products: [Product])
}

class ProductsService {
    private init(){}
    static let shared = ProductsService()
    var delegate: ProductsServiceDelegate?
    
    func observerProducts(){
        FIRDatabaseService.shared.observe(.products) { (snapshot) in
            guard let productsSnapshot = ProductSnapshot(snapshot: snapshot) else { return }
            self.delegate?.didChange(products: productsSnapshot.products)
        }
    }
    
    func post(product: Product){
        FIRDatabaseService.shared.post(parameters: product.parameters(), to: .products)
    }
    
}
