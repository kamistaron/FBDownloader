//
//  ViewController.swift
//  FBDownloader
//
//  Created by Kamran Dehghan on 1/26/1398 AP.
//  Copyright © 1398 Kamran Dehghan. All rights reserved.
//

import UIKit
import WebKit
import SwiftSoup
import Photos
import AVFoundation
import AVKit

class ViewController: UIViewController, WKUIDelegate, UIDocumentInteractionControllerDelegate {
    
    
    
    
    
    
    
     
    @IBOutlet weak var inputFiled: UITextField!


    
    
    var videoCurrentURL = "https://www.facebook.com/bbcfour/videos/2453054321373732/?t=0"
//https://www.facebook.com/doostaneshirazi/videos/385595025621125/?t=14
    var errorMessage = ""
    var finalURLString = String()
    let webView = WKWebView()
    var scrapedDownloadURL = ""
    var addressefile = ""
    var finalURL = URL(string: "")
    

//creating video thumbnail after downloading it
    func load(only:String){
        let fileAddress = only
        let location = URL(fileURLWithPath: fileAddress)
        let asset = AVAsset(url:location)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        let time = CMTime(seconds: 1, preferredTimescale: 1)
        do{
            let image = try imageGenerator.copyCGImage(at: time, actualTime: nil)
//            thumbnailoooo.image = UIImage(cgImage: image)
            
        }catch{
            print("here is the error: \(error)")
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        navigationItem.title = "Facebook Downloader"
//        let webConfiguration = WKWebViewConfiguration()
        let currentURLAddress = "https://fbdownload.io/download?video=\(videoCurrentURL)"
        let encodedURLString = currentURLAddress.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
//        print(encodedURLString)
//        print("https://fbdownload.io/download?video=https%3A%2F%2Fwww.facebook.com%2Fdoostaneshirazi%2Fvideos%2F385595025621125%2F%3Ft%3D14")
        webView.frame = CGRect(x: 0, y: 300, width: 300, height: 300)
        view.addSubview(webView)
        let myURL = URL(string:encodedURLString!)
        let request = URLRequest(url: myURL!)
        webView.load(request)
    }
    
    
    @IBAction func btnPressed(_ sender: UIButton) {
        
//        webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML") { (value, error) in
//            do{
//                print("found HTML properly")
//
//                let doc : Document = try SwiftSoup.parse(value as! String)
//                let elements : Elements = try doc.getElementsByClass("largeMargin title")
//                let array = elements.array()
//                for i in 0..<elements.array().count {
//                    print(try array[i].val())
//                }
//
//            }catch{
//                print(error)
//            }
//        }
        
        webView.evaluateJavaScript("document.getElementsByTagName('tbody')[0].getElementsByTagName('a')[0].toString()") { (value, error) in
//            print(value)
            let url = value as! String
            print(url)
            do{
//                let doc : Document = try SwiftSoup.parse(value as! String)
//                print(doc)
                self.inputFiled.text = "\(url)"
                self.finalURLString = url

            }catch{
                print(error)
            }
        }
        webView.evaluateJavaScript("document.getElementsByClassName('largeMargin title')[0].innerHTML") { (value, error) in
            do{
                print("here is the video name")
                print(value)
            }
            catch{
                print(error)
            }
        }
        
            
            
        }
//downloading the video when the buttton is tapped
    @IBAction func DLtapped(_ sender: UIButton) {
        
        if true {
            print("at last but not at least " + finalURLString)
            
        }
        
    }
//    put this in uitableview cellselected at index path to play the video in any cell when tapped
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "downloadpressed" {
            let destinationVC = segue.destination as! TableTableViewController
            destinationVC.downloadIsCalled = true
            destinationVC.urlString = finalURLString
        }
    }
//
//    @IBAction func play(_ sender: UIButton) {
//
//        let fm = FileManager.default
//        let newPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        print(newPath)
//        do {
//            let items = try fm.contentsOfDirectory(atPath: newPath)
//
//            for item in items {
//                print("Found \(item)")
//            }
//        } catch {
//            // failed to read directory – bad permissions, perhaps?
//        }
//                let lastLocation = "\(newPath)/newVideo.mp4"
//                load(only: lastLocation)
//                let url = URL(fileURLWithPath: lastLocation)
//                print("this is the url we search for \n \(url)")
//                // Create an AVPlayer, passing it the HTTP Live Streaming URL.
//                let player = AVPlayer(url: url)
//
//                // Create a new AVPlayerViewController and pass it a reference to the player.
//                let controller = AVPlayerViewController()
//                controller.player = player
//                // Modally present the player and call the player's play() method when complete.
//                present(controller, animated: true) {
//                    player.play()
//                }
//
//
//
//
//    }
    
}











/*
 if let picsUrl = URL(string: "https://(website.com)/samplepics") {
 
 let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
 
 let destinationUrl = documentsDirectoryURL.appendingPathComponent(picsUrl.lastPathComponent)
 print(destinationUrl)
 
 if FileManager.default.fileExists(atPath: destinationUrl.path) {
 print("The file already exists at path")
 
 } else {
 
 URLSession.shared.downloadTask(with: picsUrl, completionHandler: { (location, response, error) -> Void in
 guard let location = location, error == nil else { return }
 do {
 
 try FileManager.default.moveItem(at: location, to: destinationUrl)
 print("File moved to documents folder")
 } catch let error as NSError {
 print(error.localizedDescription)
 }
 }).resume()
 }
 }
 */

