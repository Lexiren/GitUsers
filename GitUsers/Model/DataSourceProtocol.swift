//
//  DataSourceProtocol.swift
//  GitUsers
//
//  Created by Lexiren on 3/29/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import UIKit

enum CompletionResult<T> {
  case Success([T])
  case Failure(NSError)
}

protocol DataSourceProtocol {
  func getListGitUsersWithCompletion((CompletionResult<GitUser>) -> Void) -> Void
}
