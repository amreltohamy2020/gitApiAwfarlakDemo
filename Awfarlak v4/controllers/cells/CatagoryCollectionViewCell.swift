//
//  CatagoryCollectionViewCell.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class CatagoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var subCatImageView: UIImageView!
    
    @IBOutlet weak var subCatLabel: UILabel!
    
    
    public func setCataegoriesCell(_ cat:Categories){
         subCatLabel.text = cat.name
        subCatImageView.layer.cornerRadius = 10
        
        
        APIManager.shared.downloadImage(stringUrl: cat.image) { (result) in
            switch result {
                
            case .success(let catImage):
                DispatchQueue.main.async {
                    self.subCatImageView.image = catImage
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
       //  catageoryImageView.image =
         //downloadImage(stringUrl:cat.image)
     }
     
//     func downloadImage(stringUrl:String){
//         guard let url = URL(string: stringUrl) else{return}
//         URLSession.shared.dataTask(with: url , completionHandler: {data,_,error in
//             guard let data = data , error == nil else{return}
//             let image = UIImage(data: data)
//             DispatchQueue.main.async {
//             self.subCatImageView.image = image
//             }
//         }).resume()
//
//     }
    
    
}
