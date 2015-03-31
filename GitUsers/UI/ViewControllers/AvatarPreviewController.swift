//
//  AvatarPreviewController.swift
//  GitUsers
//
//  Created by Lexiren on 3/30/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import UIKit

let AvatarPreviewControllerSegueFromUserListIdentifier = "AvatarPreviewControllerPresentFromUserList"

class AvatarPreviewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
  @IBOutlet weak var imageViewHeight: NSLayoutConstraint!

  var sourceUser: GitUser? {
    didSet {
      if isViewLoaded() {
        reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let gitUser = sourceUser {
      reloadData()
    }
  }
  
  func reloadData() {
    navigationItem.title = sourceUser?.login


    if let imageLink = sourceUser?.avatarLink,
       let bigSize = SettingsBundleManager.sharedInstance.imageLargeSize.toIntWithScreenScale() {
      
      if let imageURL = NSURL(string: imageLink, parametеr: "size", value: String(bigSize)) {
        spinner.startAnimating()
        imageView.setImageWithURLRequest(NSURLRequest(URL: imageURL),
          placeholderImage: nil,
          success: {
            (_, _, resultImage) -> Void in
            let size = CGFloat(SettingsBundleManager.sharedInstance.imageLargeSize.toInt()!)
            self.imageViewWidth.constant = size
            self.imageViewHeight.constant = size
            self.imageView.center = self.scrollView.center
            self.imageView.image = resultImage
            self.spinner.stopAnimating()
            
            let offsetY = (size - self.scrollView.frame.size.height)/2
            let offsetX = (size - self.scrollView.frame.size.width)/2
            
            if offsetY < 0 {
              self.scrollView.contentInset.top = -offsetY
              self.scrollView.contentInset.bottom = -offsetY
            }
            if offsetX < 0 {
              self.scrollView.contentInset.left = -offsetX
              self.scrollView.contentInset.right = -offsetX
            }
            
            self.scrollView.setContentOffset(CGPoint(x: offsetX, y: offsetY), animated: false)
          },
          failure: {
            (_, _, error) -> Void in
            UIAlertView(error: error).show()
            self.spinner.stopAnimating()
          })
      }
    }
  }

}
