//
//  DateManager.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 13.12.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import Foundation

class DateManager{
    
    static func dateFormattedString(_ date:Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
        
    }
    
    static func dateFormattedString(_ date:Date, format:String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
        
    }
    
}
