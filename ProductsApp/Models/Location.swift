//
//  Location.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import Foundation
struct Location : Codable {
    let lat : Double?
    let lng : Double?
    let address : String?
    
    enum CodingKeys: String, CodingKey {
        
        case lat = "lat"
        case lng = "lng"
        case address = "address"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        address = try values.decodeIfPresent(String.self, forKey: .address)
    }
    
}
