//
//  TableTableViewController.swift
//  FBDownloader
//
//  Created by Kamran Dehghan on 2/9/1398 AP.
//  Copyright © 1398 Kamran Dehghan. All rights reserved.
//

import UIKit
import RealmSwift
import AVKit

class TableTableViewController: UITableViewController, URLSessionDownloadDelegate, UIDocumentInteractionControllerDelegate {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var downloadProgressLabel: UILabel!
    
    
    var videoCollection : Results<Video>!
    var downloadIsCalled : Bool = false
    var urlString = ""
    var videoName = ""
    var downloadedVideos = [Video]()
    var fileAddressURL = URL(string: "")
    
    let realm = try! Realm()
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let downloadURL =  URL(string: urlString)
        
        if downloadIsCalled{
//            let finalURL = URL(string: finalURLString)
            print(downloadIsCalled)
            func createVideo(){
                var video = Video()
                video.fileURL = fileAddressURL as! String
                video.dateDownloaded = Date.init()
//                video.sourceURL
            }
            
            func DownloadIt(with urlSt: String){
                
            
            
                    let downloadTask = URLSession.shared.downloadTask(with: downloadURL!) {
                        location, response, error in

                        if error != nil {
                            print(error)
                            return
                        }else{
                        guard let fileURL = location else { return }
                        do {

                            let documentFolderURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

                            let newURL = documentFolderURL.appendingPathComponent(downloadURL!.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: newURL)

                            DispatchQueue.main.async {
                                let documentController = UIDocumentInteractionController.init(url: fileURL)
                                documentController.delegate = self
                                documentController.presentPreview(animated: true)
                            }


                            let player = AVPlayer(url: newURL)
                            
                            // Create a new AVPlayerViewController and pass it a reference to the player.
                            let controller = AVPlayerViewController()
                            controller.player = player
                            // Modally present the player and call the player's play() method when complete.
                            self.present(controller, animated: true) {
                                player.play()
                            }


                            print( "this was the saved url \n \(newURL)")
                            //                    try FileManager.default.moveItem(at: fileURL, to: savedURL)
                            //                    print("this is the fileURL \n\(fileURL)")

                        } catch {
                            print ("file error: \(error)")
                        }
                        }
                        
                        
                    }
                    downloadTask.resume()
//
                downloadIsCalled = false
                
            }//downloadit function finished
            
            DownloadIt(with: urlString)
            
            
            //create the video object here
            
            
            
            //add the video to the collection
            
            
        }//if download is called

        
    }//view did load

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell") as! TableViewCell
        
        let progressBar = progressView
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        hgjh
//    }


}
