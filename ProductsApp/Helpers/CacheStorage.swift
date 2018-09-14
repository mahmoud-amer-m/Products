//
//  CacheStorage.swift
//  ProductsApp
//
//  Created by Mahmoud Amer on 9/14/18.
//  Copyright © 2018 Amer. All rights reserved.
//

import Foundation

class CacheHelper {
    internal static let cacheDirectory: URL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("Cache")
    
    public static func getCachedRequest(cacheKey: String) -> Data? {
        let file = cacheDirectory.appendingPathComponent(cacheKey + ".txt")
        print(file.absoluteString)
        do {
            let cachedString: String = try String(contentsOf: file, encoding: .utf8)
            if cachedString.count > 0 {
                if let cachedData: Data = cachedString.data(using: .utf8){
                    print(cachedData)
                    return cachedData
                }else{
                    return nil
                }
            }else{
                return nil
            }
        }catch{
            return nil
        }
    }
    
    public static func cacheRequestResponse(cacheKey: String, response: Data) {
        createCacheDirectory(dir: cacheDirectory)
        let file = cacheDirectory.appendingPathComponent(cacheKey + ".txt")
        
        let str = String.init(data: response, encoding: .utf8)
        try? str?.write(to: file, atomically: false, encoding: .utf8)
    }
    
    
    internal static func createCacheDirectory(dir: URL) {
        do {
            try FileManager.default.createDirectory(atPath: dir.path,  withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error creating cache folder: \(error.localizedDescription)")
        }
    }
    
}
