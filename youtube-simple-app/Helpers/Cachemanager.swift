//
//  Cachemanager.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 9.12.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import Foundation

class CacheManager{
    
    static var cache = [String:Data]()
    
    static func setCache(_ url:String, _ data:Data?){
        cache[url] = data
    }
    
    
    static func getCache(_ url:String) -> Data?{
        return cache[url]
    }
    
}
