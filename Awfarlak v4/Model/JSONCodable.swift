//
//  JSONCodable.swift
//  Awfarlak v4
//
//  Created by MacBook on 7/20/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation



//MARK:- category and sub category codable json structs
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

//MARK:- all products codable json structs
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

//MARK:- product codable json structs

struct ProductDetails:Codable{
    let favorite : Int
    let status : Int
    let id : String
    let image : String
    let album : [String]
    let title : String
    let slug : String
    let description : String
    let price_after_discount : String
    let price_before_discount : String
    let discount : String
    let rating : Int
    let quantity : Int
    let colors : [String]
    let comments : [Comment]

}

struct Comment:Codable {
    let id : String
    let comment : String
    let user_name : String
    let user_photo : String
    let date : String
}
