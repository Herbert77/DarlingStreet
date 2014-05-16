//
//  AboutViewController.h
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TeamViewController;
@class AuthorizationViewController;
@class FeedBackController;

@interface AboutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) UITableView *tableView;

@property (retain, nonatomic) TeamViewController *teamViewController;

@property (retain, nonatomic) AuthorizationViewController *authorizationViewController;

@property (retain, nonatomic) FeedBackController *feedBackController;

@end
