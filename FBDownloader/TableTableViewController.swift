//
//  TableTableViewController.swift
//  FBDownloader
//
//  Created by Kamran Dehghan on 2/9/1398 AP.
//  Copyright © 1398 Kamran Dehghan. All rights reserved.
//

import UIKit
import RealmSwift

class TableTableViewController: UITableViewController, URLSessionDownloadDelegate, UIDocumentInteractionControllerDelegate {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var downloadProgressLabel: UILabel!
    
    var downloadIsCalled : Bool = false
    var urlString = ""
    var videoName = ""
    var videoDownloads = [Video]()
    
    
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let downloadURL =  URL(string: urlString)
        
        if downloadIsCalled{
//            let finalURL = URL(string: finalURLString)
            
            let downloadTask = URLSession.shared.downloadTask(with: downloadURL!) {
                location, response, errorOrNil in
                
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
                    
                    
                    
                    print( "this was the saved url \n \(newURL)")
                    //                    try FileManager.default.moveItem(at: fileURL, to: savedURL)
                    //                    print("this is the fileURL \n\(fileURL)")
                } catch {
                    print ("file error: \(error)")
                }
            }
            downloadTask.resume()
            

        }

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell") as! TableViewCell
        
        let progressBar = progressView
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }


}
