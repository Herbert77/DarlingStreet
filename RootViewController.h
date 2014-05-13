//
//  RootViewController.h
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsViewController;
@class MyBooksViewController;
@class FollowingViewController;
@class AboutViewController;

@interface RootViewController : UITabBarController

@property (strong, nonatomic) NewsViewController *newsViewController;

@property (strong, nonatomic) MyBooksViewController *myBooksViewController;

@property (strong, nonatomic) FollowingViewController *followingViewController;

@property (strong, nonatomic) AboutViewController *aboutViewController;

@end
