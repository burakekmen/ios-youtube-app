//
//  Video.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 26.11.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    
    enum CodingKeys : String, CodingKey{
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    
    init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // veriler dolduruluyor
        self.title = try snippedContainer.decode(String.self, forKey: .title)
        self.description = try snippedContainer.decode(String.self, forKey: .description)
        self.published = try snippedContainer.decode(Date.self, forKey: .published)
        
        let thumbnailContainer = try snippedContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        // veri dolduruluyor
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourceContainer = try snippedContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        // veri dolduruluyor
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
        
    }
}
