//
//  Response.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 26.11.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items :[Video]?
    
    enum CodingKeys: String, CodingKey{
        
        case items
    }
    
    init(from decoder:Decoder) throws {
                
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
    
    
}
