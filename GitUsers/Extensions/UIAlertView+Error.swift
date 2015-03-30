//
//  UIAlertView+Error.swift
//  GitUsers
//
//  Created by Lexiren on 3/30/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import Foundation

typealias UIAlertView_Error = UIAlertView
extension UIAlertView_Error {
  convenience init(error: NSError) {
    let localizedErrorTitle = NSLocalizedString("ErrorTitle", comment:"")
    let localizedCancelButtonTitle = NSLocalizedString("CancelButtonTitle", comment:"")
    self.init(title: localizedErrorTitle,
            message: error.localizedDescription,
           delegate: nil,
  cancelButtonTitle: localizedCancelButtonTitle)
  }
}
