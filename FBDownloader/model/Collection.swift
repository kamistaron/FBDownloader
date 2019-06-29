//
//  VideoCollection.swift
//  FBDownloader
//
//  Created by Kamran Dehghan on 4/8/1398 AP.
//  Copyright © 1398 Kamran Dehghan. All rights reserved.
//

import Foundation
import RealmSwift


class Collection: Object {
    var videos = List<Video>()
}
