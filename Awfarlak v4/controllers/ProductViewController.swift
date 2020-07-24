//
//  ProductViewController.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/23/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource{
    
    public var productImageSamples = [UIImage]()
    var productDietals : ProductDetails?
    
    
    //labels and imageViews
    @IBOutlet weak var paidAdvertisment: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!
    //buttons
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var callButtonOutlet: UIButton!
    @IBOutlet weak var addToCartButtonOutlet: UIButton!
    
    //   @IBOutlet weak var addToCatrButton: UIButton!
    //   @IBOutlet weak var callButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //   @IBOutlet weak var productImagesImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        configureUIShapeAndColors()
        // Do any additional setup after loading the view.
        
        //get all data for the view from api manager
        apiConnection()
      
        
        // getting images for samples inn array
     
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.collectionView.reloadData()
    }
   
    func apiConnection(){
        let stringUrl = "https://webdesign.be4em.info/awfarlkapi_ar/Product/productdetails/549834453/25598/703"
              
              guard let url = URL(string: stringUrl) else{return}
              APIManager.shared.getProductData(for: url) { (result) in
                  print(result)
                  switch result {
                      
                  case .success(let productDetailsData):
                      self.productDietals = productDetailsData
                      print(productDetailsData)
                      self.setupUI(productDetailsData)
                      
                      
                  case .failure(let error):
                      print(error.localizedDescription)
                  }
              }
              
    }
    
    func setupUI(_ product:ProductDetails)  {
         let  productImageSamplesString = product.album
         DispatchQueue.main.async {
            self.priceLabel.text = product.price_after_discount
            self.productNameLabel.text = product.description
        
        
        
        
             for stringUrl in productImageSamplesString {
                 print("***************\(stringUrl)*********")
                 APIManager.shared.downloadImage(stringUrl: stringUrl) { (result) in
                     switch result {
                     case .success(let image):
                        print("sucess download image number\(self.productImageSamples.count)")
                         self.productImageSamples.append(image)
                         
                     case .failure(let error):
                        print("error download image")
                         print(error.localizedDescription)
                     }
                 }
                 print(stringUrl)
             }
        
        }
        
       
    }
    
    
    func configureUIShapeAndColors(){
        //TODO:- add lables and buttons shapes
        detailsButton.layer.cornerRadius = 5
        commentsButton.layer.cornerRadius = 5
        self.priceLabel.round(corners: [.topRight,.bottomRight], cornerRadius: 20)
        self.addToCartButtonOutlet.round(corners: [.topRight,.bottomRight], cornerRadius: 15)
        self.callButtonOutlet.round(corners: [.topLeft,.bottomLeft], cornerRadius: 15)
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK:- buttons
    @IBAction func addRateButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func datailsButtonClicked(_ sender: Any) {
        detailsButton.backgroundColor = .orange
        detailsButton.titleLabel?.textColor = .white
        
        commentsButton.backgroundColor = .clear
        commentsButton.titleLabel?.textColor  = .black
        
    }
    @IBAction func commentsButtonClicked(_ sender: Any) {
        detailsButton.backgroundColor = .clear
        detailsButton.titleLabel?.textColor = .black
        
        commentsButton.backgroundColor = .orange
        commentsButton.titleLabel?.textColor  = .white
        
    }
    @IBAction func callButtonClicked(_ sender: Any) {
        
    }
    @IBAction func adToCartButtonClicked(_ sender: Any) {
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("*************************\(productImageSamples.count)")
        return productImageSamples.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productViewCell", for: indexPath) as? ProductViewSamplesCollectionViewCell
        cell?.productSamplesImageView.image = productImageSamples[indexPath.row]
        print("iam in cell and data added")
        return cell!
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: 300, height: 300)
    //    }
    
}



extension UIView {
    
    func round(corners: UIRectCorner, cornerRadius: Double) {
        
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}
