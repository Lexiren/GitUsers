//
//  NSError+Extensions.swift
//  GitUsers
//
//  Created by Lexiren on 3/30/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import Foundation

let NSErrorInternalDomain = "NSErrorInternalDomain"

enum NSErrorInternalCode: Int {
  case WrongDataFormat
}

typealias NSError_Extensions = NSError
extension NSError_Extensions {
  convenience init?(errorCode: NSErrorInternalCode) {
    var localizedErrorDescription: String
    
    switch errorCode {
    case .WrongDataFormat: localizedErrorDescription = NSLocalizedString("WrongDataFormatErrorDescription", comment:"")
    }
    
    self.init(domain: NSErrorInternalDomain,
                code: errorCode.rawValue,
            userInfo: [NSLocalizedDescriptionKey : localizedErrorDescription])
  }
}
