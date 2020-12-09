//
//  ViewController.swift
//  youtube-simple-app
//
//  Created by BURAK EKMEN on 24.11.2020.
//  Copyright © 2020 Burak Ekmen. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, ModelDelegate{
    
    var model = Model()
    var videos = [Video]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self
        
        model.getVideos()
    }
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        tableView.reloadData()
    }
    
    // MARK: tableview islemleri
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        cell.setCell(self.videos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

}

