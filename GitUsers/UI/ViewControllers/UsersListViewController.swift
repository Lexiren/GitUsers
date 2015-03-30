//
//  UsersListViewController.swift
//  GitUsers
//
//  Created by Lexiren on 3/29/15.
//  Copyright (c) 2015 maidanykdev. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  
  var sourceItems: [GitUser] = [] {
    didSet{
      tableView.reloadData()
    }
  }
  
  var dataSource = DataManager.sharedInstance
  var refreshControl: UIRefreshControl!
  
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    refreshControl = UIRefreshControl()
    refreshControl.attributedTitle = NSAttributedString(string: NSLocalizedString("PullToRefresh", comment: ""))
    refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
    tableView.addSubview(refreshControl)
    refreshControl.beginRefreshing()
    refresh(refreshControl)
  }
  
  func refresh(sender: AnyObject) {
    dataSource.getListGitUsersWithCompletion {
      (completionResult) -> Void in
      switch completionResult {
      case .Success(let users): self.sourceItems = users
      case .Failure(let error):
        self.sourceItems.removeAll()
        UIAlertView(error: error).show()
      }
      self.refreshControl.endRefreshing()
    }
  }
  
  // MARK: - UITableViewDataSource
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.sourceItems.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(GitUserTableViewCellIdentifier) as? GitUserTableViewCell
    if cell == nil {
      cell = GitUserTableViewCell()
    }
    
    cell?.gitUser = sourceItems[indexPath.row]
    
    return cell!
  }
  
}
