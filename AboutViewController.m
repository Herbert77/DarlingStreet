//
//  AboutViewController.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "AboutViewController.h"
#import "TeamViewController.h"
#import "AuthorizationViewController.h"
#import "FeedBackController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.scrollEnabled = NO;
    
    [self.view addSubview:_tableView];
    
}


#pragma mark -
#pragma mark TableView delegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 && indexPath.section == 1) {

        _teamViewController = [[TeamViewController alloc] init];
        
        [[self navigationController] pushViewController:_teamViewController animated:YES];
    }
    
    if (indexPath.row == 0 && indexPath.section == 0) {
       
        _authorizationViewController = [[AuthorizationViewController alloc] init];
        
        [[self navigationController] pushViewController:_authorizationViewController animated:YES];
    }
    
    if (indexPath.row == 1 && indexPath.section == 1) {
       
        _feedBackController = [[FeedBackController alloc] init];
        
        [[self navigationController] pushViewController:_feedBackController animated:YES];
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"设置";
    } else {
        return @"其它";
    }
}


#pragma mark -
#pragma mark TableView dataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if (section == 0) {
        return 3;
    } else {
        return 3;
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"aboutCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"登入/登出";
            } else if (indexPath.row == 1) {
                cell.textLabel.text = @"消息设置";
            } else {
                cell.textLabel.text = @"账号设置";
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"开发团队";
            } else if (indexPath.row == 1){
                cell.textLabel.text = @"意见反馈";
            } else {
                cell.textLabel.text = @"相关";
            }
            break;
        default:
            break;
    }
    
    // TODO: configure the about's cell
    
    return cell;
    
}


@end
