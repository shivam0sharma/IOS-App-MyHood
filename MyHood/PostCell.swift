//
//  PostCell.swift
//  MyHood
//
//  Created by Shivam Sharma on 6/16/17.
//  Copyright © 2017 ShivamSharma. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
    }

    func configureCell(post: Post) {
        postImage.image = DataService.instance.imageForPath(path: post.imagePath)
        titleLabel.text = post.title
        descriptionLabel.text = post.postDescription
    }

}
