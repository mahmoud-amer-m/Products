//
//  Product.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import Foundation

typealias BaseModel = [Product]

struct Product : Codable {
    let id : Int?
    let description : String?
    let imageUrl : String?
    let location : Location?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case description = "description"
        case imageUrl = "imageUrl"
        case location = "location"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
    }
}
