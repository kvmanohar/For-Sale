//
//  Product.swift
//  For Sale
//
//  Created by Manohar Kurapati on 22/06/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//

import Foundation

struct Product {
    let title: String
    let cost: Double
    
    func price() -> String{
        let costString = String(format: "%.2f",cost)
      return "£" + costString
    }
}
