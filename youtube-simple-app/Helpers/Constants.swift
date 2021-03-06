//
//  Constants.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 1.12.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import Foundation


struct Constants {
    static var API_KEY = "AIzaSyCO0i9d9f_nfPOZhsi6QHAR7-ipPchlNMw"
    static var PLAYLIST_ID = "RDCMUC2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_VIDEO_URL = "https://youtube.com/embed/"
}

