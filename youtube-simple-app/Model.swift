//
//  Model.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 26.11.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate : ModelDelegate?
    
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
            
            if error != nil || data == nil{
                return
            }
    
            do{
                // modelleme yapiliyor
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                
                if response.items != nil {
                    DispatchQueue.main.async{
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                
                dump(response)
                
            }catch{
                
            }
            
            
        }
        
        
        // session kapatiliyor
        dataTask.resume()
        
    }
    
}
