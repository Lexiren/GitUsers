//
//  GitUser.swift
//  GitUsers
//
//  Created by Lexiren on 3/29/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

let ProfileLinkKey = "html_url"
let AvatarLinkKey  = "avatar_url"
let LoginKey       = "login"

class GitUser {
  let profileLink: String?
  let avatarLink:  String?
  let login:       String?
  
  
  init(dictionary: [String : AnyObject]) {
    profileLink = dictionary[ProfileLinkKey] as? String
    avatarLink = dictionary[AvatarLinkKey] as? String
    login = dictionary[LoginKey] as? String
  }
}
