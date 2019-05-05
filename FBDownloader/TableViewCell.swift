//
//  TableViewCell.swift
//  FBDownloader
//
//  Created by Kamran Dehghan on 2/14/1398 AP.
//  Copyright © 1398 Kamran Dehghan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var progStatusLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var videoName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func commonInit(downloadStatus:UIView, progressLabel: String, thmbnil: UIImage, name: String){
        progStatusLabel.text = progressLabel
        progressView = downloadStatus
        thumbnail.image = thmbnil
        videoName.text = name
    }

}
