//
//  JSONCodable.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation


// structs for the first view Categories
struct MainCategeory:Decodable {
    let catrgories :[Categories]
    let status:Int
}
struct Categories :Decodable{
    let id :String
    let name:String
    let image:String
    let adv:String
}


// structs for third view cataegory********(all products)**********
struct MainProducts:Decodable{
    let status:Int
    let products:[Product]
}
struct Product :Decodable{
    
    let id :String
    let title:String
    let price_after_discount:String
    let price_before_discount :String
    let discount:String
    let image:String
    let rating:String
    let favorite:Int
    
}


