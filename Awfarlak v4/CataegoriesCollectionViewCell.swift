//
//  CataegoriesCollectionViewCell.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class CataegoriesCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var catageoryImageView: UIImageView!
    
    @IBOutlet weak var cataegoryName: UILabel!
  
    
    public func setCataegoriesCell(_ cat:Categories){
        cataegoryName.text = cat.name
        
        APIManager.shared.downloadImage(stringUrl: cat.image) { (result) in
            switch result {
                
            case .success(let catImage):
                DispatchQueue.main.async {
                    self.catageoryImageView.image = catImage
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
      //  catageoryImageView.image =
//        downloadImage(stringUrl:cat.image)
    }
//
//    func downloadImage(stringUrl:String){
//        guard let url = URL(string: stringUrl) else{return}
//        URLSession.shared.dataTask(with: url , completionHandler: {data,_,error in
//            guard let data = data , error == nil else{return}
//            let image = UIImage(data: data)
//            DispatchQueue.main.async {
//            self.catageoryImageView.image = image
//            }
//        }).resume()
//
//    }
}

/*
 import SDWebImage
 
 guard let imageurl = media.url else{return}
imageView.sd_setImage(with: imageurl, completed: nil)
 */

