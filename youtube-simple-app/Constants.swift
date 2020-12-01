//
//  Constants.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 1.12.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import Foundation


struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = ""
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}

