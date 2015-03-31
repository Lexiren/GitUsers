//
//  DataManager.swift
//  GitUsers
//
//  Created by Lexiren on 3/29/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import AFNetworking

let APIRequestNameUsers  = "users"

class DataManager: DataSourceProtocol {
  static let sharedInstance = DataManager()
  private lazy var networkManager: AFHTTPRequestOperationManager = {
    let serverURL = NSURL(string: SettingsBundleManager.sharedInstance.serverAPI)
    return AFHTTPRequestOperationManager(baseURL: serverURL)
  }()
  
  func getListGitUsersWithCompletion(completion: ((CompletionResult<GitUser>) -> Void)) {
    networkManager.GET(APIRequestNameUsers,
      parameters: nil,
      success: { (_, responseObject) -> Void in
        var users = [GitUser]()
        var error: NSError?
        if let responseObject = responseObject as? [[String : AnyObject]] {
          for jsonDictionary in responseObject {
            users.append(GitUser(dictionary: jsonDictionary))
          }
        } else {
          error = NSError(errorCode: NSErrorInternalCode.WrongDataFormat)
        }
        completion(error == nil ? CompletionResult.Success(users) : CompletionResult.Failure(error!))
      },
      failure: {
        (_, error) -> Void in
        completion(CompletionResult.Failure(error))
    })
    
  }

  
}
