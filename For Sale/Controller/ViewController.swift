//
//  ViewController.swift
//  For Sale
//
//  Created by Manohar Kurapati on 22/06/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        FIRDatabaseService.shared.post(parameters: ["title":"Hot shirt", "cost":"14.00"], to: .products)
        FIRDatabaseService.shared.observe(.products) { (snapshot) in
            guard let productsSnapshot = ProductSnapshot(snapshot: snapshot) else { return }
            print(productsSnapshot)
        }
        
    }
    @IBAction func onAddTapped(_ sender: Any) {
        
        AlertService.addProductAlert(in: self) { (product) in
            self.products.append(product)
            self.collectionView.reloadData()
        }
    }
    
  
    @IBAction func onSubscribeTapped(_ sender: Any) {
        AlertService.subscribeAlert(in: self)
    }
    
}

extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell
            else {
            return UICollectionViewCell()
        }
        
        let product = products[indexPath.item]
        cell.configure(with: product)
        return cell
    }
    
}

