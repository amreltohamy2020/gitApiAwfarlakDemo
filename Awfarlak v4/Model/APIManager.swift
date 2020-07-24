//
//  APIManager.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import UIKit
class APIManager {
    
    static let shared = APIManager()
    
    
    //MARK:- api hundler
    public func getApiData(for url:URL,compilation:@escaping(Result<[Categories],Error>)->Void){
        
        // session
        let session = URLSession.shared
        
        //dataTask
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil , data != nil else {
                compilation(.failure(APIError.failedToGetData))
                return
            }
            let decoder = JSONDecoder()
            do {
                let categories = try decoder.decode(MainCategeory.self, from: data!)
                //print(categories)
                compilation(.success(categories.catrgories))
            }catch{
                compilation(.failure(APIError.failedToDecodeJSON))
            }
            
        }
        task.resume()
    }
    
    public func getAllProductsData(for url:URL,compilation:@escaping(Result<[Product],Error>)->Void){
         print("in all products")
         // session
         let session = URLSession.shared
         
         //dataTask
         let task = session.dataTask(with: url) { (data, response, error) in
             guard error == nil , data != nil else {
                print("error in task")
                 compilation(.failure(APIError.failedToGetData))
                 return
             }
            print("task sucess")
             let decoder = JSONDecoder()
             do {
                 let mainProducts = try decoder.decode(MainProducts.self, from: data!)
                 //print(categories)
                compilation(.success(mainProducts.products))
             }catch{
                print("error in decode")
                 compilation(.failure(APIError.failedToDecodeJSON))
             }
             
         }
         task.resume()
     }
    
    public func getProductData(for url:URL,compilation:@escaping(Result<ProductDetails,Error>)->Void){
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil , data != nil else {
                print("error in task")
                compilation(.failure(APIError.failedToGetData))
                return
            }
            print("task sucess")
            print(data)
            let decoder = JSONDecoder()
            do{
                let productDetailes = try decoder.decode(ProductDetails.self, from: data!)
                compilation(.success(productDetailes))
            }catch{
                print("error in decode")
                compilation(.failure(APIError.failedToDecodeJSON))
            }
        }
        task.resume()
        
    }
    
    
    
    
    //MARK:- image hundler
    public func downloadImage(stringUrl:String,compilation:@escaping(Result<UIImage,Error>)->Void){
        guard let url = URL(string: stringUrl) else{return}
                URLSession.shared.dataTask(with: url , completionHandler: {data,_,error in
                    guard let data = data , error == nil else{
                        compilation(.failure(APIError.failedToGetImageData))
                        return}
                    guard let image = UIImage(data: data) else{
                        compilation(.failure(APIError.imageBadFormate))
                        return
                    }
                    compilation(.success(image))
                    
                }).resume()
    }
  
}

public enum APIError : Error {
    case failedToGetData
    case failedToDecodeJSON
    case failedToGetImageData
    case imageBadFormate
    
}






