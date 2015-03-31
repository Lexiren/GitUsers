//
//  GitUserTableViewCell.swift
//  GitUsers
//
//  Created by Lexiren on 3/30/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import UIKit

let GitUserTableViewCellIdentifier = "GitUserCellIdetifier"
let DefaultAvatarName = "DefaultAvatar"

class GitUserTableViewCell: UITableViewCell {
  @IBOutlet weak var avatarView: UIImageView!
  @IBOutlet weak var loginLabel: UILabel!
  @IBOutlet weak var profileLinkLabel: UILabel!
  
  var gitUser: GitUser? {
    didSet {
      loginLabel.text = gitUser?.login
      profileLinkLabel.text = gitUser?.profileLink
      
      if let imageLink = gitUser?.avatarLink,
         let imageSize = SettingsBundleManager.sharedInstance.imageSmallSize.toIntWithScreenScale() {
        if let imageURL = NSURL(string: imageLink,
         parametеr: "size",
         value: String(imageSize))
        {
          avatarView.setImageWithURL(imageURL, placeholderImage: UIImage(named: DefaultAvatarName))
        }
      }
    }
  }
  
  override func prepareForReuse() {
    avatarView.cancelImageRequestOperation()
    avatarView.image = UIImage(named: DefaultAvatarName)
  }
}
