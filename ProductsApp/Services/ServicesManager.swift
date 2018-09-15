//
//  ServicesManager.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import Foundation
import Alamofire
import Reachability

class ServicesManager {
    
    public static func getDeliveries(offset: Int, limit: Int, completion: @escaping (BaseModel?)->(), error: @escaping (String)->()) {
        
        let requestCacheKey: String = "\(Constants.deliveries.rawValue)?offset=\(String(offset))&limit=\(String(limit))"
        
        //If no network, get cached response "if available"
        let reachability = Reachability()
        if reachability?.connection == .none ||  reachability?.connection.description == "No Connection"{
            if let data = CacheHelper.getCachedRequest(cacheKey: requestCacheKey) {
                print("cached and fetched from cache : \(data)")
                let jsonDecoder = JSONDecoder()
                if let baseModel = try? jsonDecoder.decode(BaseModel.self, from: data) {
                    completion(baseModel)
                } else {
                    error(DeliveryError.jsonError.rawValue)
                }
            } else {
                //Not cached before
                error(DeliveryError.cacheError.rawValue)
            }
        } else {
            let urlWithEndPoint: String = Constants.baseURL.rawValue + requestCacheKey
            Alamofire.request(urlWithEndPoint, method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    //First, check for request error
                    if let requestError = response.error {
                        error(requestError.localizedDescription)
                        return
                    }
                    
                    if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                        if let baseModel = try? JSONDecoder().decode(BaseModel.self, from: data) {
                            CacheHelper.cacheRequestResponse(cacheKey: requestCacheKey, response: data)
                            completion(baseModel)
                        } else {
                            //Json Error
                            error(DeliveryError.jsonError.rawValue)
                        }
                    } else {
                        //No response from server
                        error(DeliveryError.noResponseError.rawValue)
                    }
            }
        }
    }
}

enum DeliveryError: String {
    case networkError = "No internet connection"
    case cacheError = "No internet and No cached version for this request"
    case jsonError = "Error decoding json"
    case noResponseError = "No response from server"
}
