//
//  ProductsCollectionViewCell.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/21/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productSetupButton: UIButton!
    
    
    @IBOutlet weak var ratingImageView: UIImageView!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var FavoriteButton: UIButton!
    
    @IBOutlet weak var addToMarketButton: UIButton!
    
    
    public func setProductCell(product:Product){
        
        
        discountLabel.text = product.discount
         productNameLabel.text = product.title
        priceLabel.text = product.price_after_discount
        
        
        //todo
        APIManager.shared.downloadImage(stringUrl: product.image) { (result) in
            switch result {
                
            case .success(let productImage):
                DispatchQueue.main.async{
                   self.productImageView.image = productImage
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        
       
        
        
        
    }
    
    
    
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func productSetupButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func addToMarketButtonClicked(_ sender: UIButton) {
        
    }
    
    
    
}
