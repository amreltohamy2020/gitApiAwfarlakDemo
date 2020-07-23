//
//  AllProductsViewController.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/21/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class AllProductsViewController: UIViewController {

    var allProducts = [Product]()
    public let destinationUrl:String = ""
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("iam in all products")

        // Do any additional setup after loading the view.
        //delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.backgroundView = UIView.init(frame: CGRect.zero)
        // apis and getting data
        let stringUrl = "https://webdesign.be4em.info/awfarlkapi_ar/Category/getAllProduct/549834453/25598/55/135/1"
        
        guard let url = URL(string: stringUrl) else{return}
        
        APIManager.shared.getAllProductsData(for: url) { (results) in
            switch results {
                
            case .success(let productsArray):
                print("product array sucessfully here")
                self.allProducts = productsArray
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    


}


extension AllProductsViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(allProducts.count)
        return allProducts.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(allProducts[indexPath.row].title)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllProductesCell", for: indexPath) as! ProductsCollectionViewCell
        
        cell.setProductCell(product: allProducts[indexPath.row])
        cell.layer.cornerRadius = 7
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        print("show single product view controller")
        
    }
    
    
    
}
