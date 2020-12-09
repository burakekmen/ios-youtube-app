//
//  VideoTableViewCell.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 9.12.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(_ v:Video){
        
        self.video = v
        
        // video modeli dolu kontrolu
        guard self.video != nil else {
            return
        }
        
        // title modellendi
        self.titleLabel.text = video?.title
        
        // date modellendi
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = dateFormatter.string(from: video!.published)
        
        // thumbnail modelleniyor
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // check cache befor download data
        if let cachedData = CacheManager.getCache(self.video!.thumbnail) {
            
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        
        // thumbnail indiriliyor
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                	
                CacheManager.setCache(url!.absoluteString, data)
                
                if url!.absoluteString != self.video!.thumbnail{
                    
                    // videocell yenilenmiş ve indirilen thumbnail ie eslesen bir video kaydı bulunmuyor
                    return
                }
                
                // create image object
                let image = UIImage(data: data!)
                
                // set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
        
    }

}
