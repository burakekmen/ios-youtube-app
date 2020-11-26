//
//  Model.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 26.11.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos(){
        
        // url olusturuldu
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //session acildi
        let session = URLSession.shared
        
        // istek yapildi
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // herhangi bir hata var mi kontrol ediliyor
            if error != nil || data != nil{
                return
            }
            
            
            // modelleme yapiliyor
        }
        
        
        // session kapatiliyor
        dataTask.resume()
        
    }
    
}
