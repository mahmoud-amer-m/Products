//
//  ServicesManager.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import Foundation
import Alamofire

class ServicesManager {
    
    public static func getDeliveries(completion: @escaping (BaseModel?)->()) {
        
        let cacheKey: String = Constants.deliveries.rawValue + "?offset=0&limit=7"
        let urlWithEndPoint: String = Constants.baseURL.rawValue + cacheKey
        
        if let data = CacheHelper.getCachedRequest(cacheKey: cacheKey) {
            print("cached and fetched from cache : \(data)")
            let jsonDecoder = JSONDecoder()
            if let baseModel = try? jsonDecoder.decode(BaseModel.self, from: data) {
                completion(baseModel)
            }
        }else{
            Alamofire.request(urlWithEndPoint, method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                        if let baseModel = try? JSONDecoder().decode(BaseModel.self, from: data) {
                            CacheHelper.cacheRequestResponse(cacheKey: cacheKey, response: data)
                            completion(baseModel)
                        }
                        
                    }
            }
        }
        
    }
    
    
}
