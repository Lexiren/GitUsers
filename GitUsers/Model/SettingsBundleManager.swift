//
//  SettingsBundleManager.swift
//  GitUsers
//
//  Created by Lexiren on 3/30/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import Foundation

let APIServerSettingsKey = "SettingsAPIServer"
let SettingsImageSizeSmallKey = "SettingsImageSizeSmall"

class SettingsBundleManager {
  static var sharedInstance = SettingsBundleManager()
  private let settings = NSUserDefaults.standardUserDefaults()
  
  var serverAPI: String {
    get {
      return settings.objectForKey(APIServerSettingsKey) as! String
    }
  }
  
  var imageSmallSize: Int {
    get {
      return settings.stringForKey(SettingsImageSizeSmallKey)!.toInt()!
    }
  }
  
  init() {
    if settings.objectForKey(APIServerSettingsKey) == nil {
      registerDefaultsFromSettingsBundle()
    }
  }
  
  private func registerDefaultsFromSettingsBundle() {
    if let settingsBundle = NSBundle.mainBundle().pathForResource("Settings", ofType: "bundle") {
      let settings = NSDictionary(contentsOfFile: settingsBundle.stringByAppendingPathComponent("Root.plist"))
      let preferences = settings?.objectForKey("PreferenceSpecifiers") as! [[String : AnyObject]]
      var defaultsToRegister = [String : AnyObject]()
      for prefSpecification in preferences {
        
        if let key = prefSpecification["Key"] as? String,
         let defaultValue: AnyObject = prefSpecification["DefaultValue"] {
          defaultsToRegister[key] = defaultValue
        }
      }
      NSUserDefaults.standardUserDefaults().registerDefaults(defaultsToRegister)
    } else {
      println("Could not find Settings.bundle")
    }
  }

}

