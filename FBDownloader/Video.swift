//
//  Video.swift
//  FBDownloader
//
//  Created by Kamran Dehghan on 2/5/1398 AP.
//  Copyright © 1398 Kamran Dehghan. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import AVFoundation

class Video: Object {
    @objc dynamic var sourceURL : String = ""
    @objc dynamic var fileURL : String = ""
    @objc dynamic var videoName = ""
    @objc dynamic var thumbnail = UIImage()
    @objc dynamic var dateDownloaded = Date()
    func commonInit(webURL: String, fileAddress: String, name: String){
        dateDownloaded = Date.init()
        sourceURL = webURL
        fileURL = fileAddress
        let asset = AVAsset(url: URL(fileURLWithPath: fileAddress))
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        let time = CMTime(seconds: 1, preferredTimescale: 1)
        do{
            let image = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            thumbnail = UIImage(cgImage: image)
            
        }catch{
            print("here is the error: \(error)")
        }
        videoName = name
        thumbnail = UIImage(named: "default-video-thumbnail")!
    }
}
