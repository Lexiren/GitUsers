//
//  NSURL+Parameters.swift
//  GitUsers
//
//  Created by Lexiren on 3/30/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import Foundation

typealias NSURL_Parameters = NSURL
extension NSURL_Parameters {
  convenience init?(var string: String, parametеr: String, value: String) {
    string += "&\(parametеr)=\(value)"
    self.init(string: string)
  }
}
