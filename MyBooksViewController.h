//
//  MyBooksViewController.h
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchViewController;

@interface MyBooksViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UINavigationController *searchNavigation;

@property (retain, nonatomic) UITableView *tableView;

@property (strong, nonatomic) SearchViewController *searchViewController;

@end
