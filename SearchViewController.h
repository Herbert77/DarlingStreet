//
//  SearchViewController.h
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate>

@property (retain, nonatomic) UISearchBar *searchBar;

@property (retain, nonatomic) UITableView *tableView;

@property (retain, nonatomic) UISearchDisplayController *mySearchDisplayController;

@end
