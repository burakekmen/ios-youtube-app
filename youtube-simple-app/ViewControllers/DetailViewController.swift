//
//  DetailViewController.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 13.12.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var descriptionTView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // clear the fields
        self.titleLabel.text = ""
        self.dateLabel.text = ""
        self.descriptionTView.text = ""
        
        guard video != nil else {
            return
        }
        
        //create the embed url
        let embedUrl = Constants.YT_EMBED_VIDEO_URL + video!.videoId
        
        // load it into the webview
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webview.load(request)
        
        // set the title
        self.titleLabel.text = video!.title
        
        // set the date
        self.dateLabel.text = DateManager.dateFormattedString(video!.published)
        
        // set the desc
        self.descriptionTView.text = video!.description
        
    }
    
}
