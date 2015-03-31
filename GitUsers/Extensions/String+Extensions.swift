//
//  String+Extensions.swift
//  GitUsers
//
//  Created by Lexiren on 3/31/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import Foundation

typealias String_Extensions = String
extension String_Extensions {
  func toIntWithScreenScale() -> Int? {
    var intValue = self.toInt()
    if intValue != nil {
      intValue! *= Int(UIScreen.mainScreen().scale)
    }
    return intValue
  }
}
