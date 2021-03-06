//
//  AlertService.swift
//  For Sale
//
//  Created by Manohar Kurapati on 22/06/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//

import UIKit

class AlertService{
    
    private init(){}
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping (Product) -> Void) {
        let alert = UIAlertController(title: "New Product", message: "What's for sale?",
                                      preferredStyle: .alert)
        alert.addTextField { (titleTF) in
            titleTF.placeholder = "Title"
        }
        
        alert.addTextField { (priceTF) in
            priceTF.placeholder = "Price"
            priceTF.keyboardType = .numbersAndPunctuation
        }
        
        let send = UIAlertAction(title: "Send", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text,
                let price = alert.textFields?.last?.text,
                let cost = Double(price)
                else { return }
            
            let product = Product(title: title, cost: cost)
            completion(product)
        }
        
        alert.addAction(send)
        vc.present(alert, animated: true, completion: nil)
        
    }
    
    static func subscribeAlert(in vc: UIViewController){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "Subscribe", style: .default) { (_) in
            
        }
        
        let unsubscribe = UIAlertAction(title: "Unsubscribe", style: .default) { (_) in
            
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        vc.present(alert, animated: true, completion: nil)
    }
    
}
