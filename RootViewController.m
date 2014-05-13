//
//  RootViewController.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "RootViewController.h"

#import "NewsViewController.h"
#import "MyBooksViewController.h"
#import "FollowingViewController.h"
#import "AboutViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 主体框架部分
    
    _newsViewController = [[NewsViewController alloc] init];
    UINavigationController *newsNavigation = [[UINavigationController alloc] initWithRootViewController:_newsViewController];
    _newsViewController.navigationItem.title = @"DarlingStreet";
    newsNavigation.tabBarItem.title = @"动态";
    
    
    _myBooksViewController = [[MyBooksViewController alloc] init];
    UINavigationController *myBooksNavigation = [[UINavigationController alloc] initWithRootViewController:_myBooksViewController];
    _myBooksViewController.navigationItem.title = @"我的书";
    myBooksNavigation.tabBarItem.title = @"我的书";
    
    _followingViewController = [[FollowingViewController alloc] init];
    UINavigationController *followingNavigation = [[UINavigationController alloc] initWithRootViewController:_followingViewController];
    _followingViewController.navigationItem.title = @"关注的人";
    followingNavigation.tabBarItem.title = @"关注的人";
    
    _aboutViewController = [[AboutViewController alloc] init];
    UINavigationController *aboutNavigation = [[UINavigationController alloc] initWithRootViewController:_aboutViewController];
    _aboutViewController.navigationItem.title = @"关于";
    aboutNavigation.tabBarItem.title = @"关于";
    
    NSArray *navigationControllers = @[newsNavigation, myBooksNavigation, followingNavigation, aboutNavigation];
    
    [self setViewControllers:navigationControllers animated:YES];
    

}


@end
