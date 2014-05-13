//
//  FollowingViewController.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-11.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "FollowingViewController.h"

#include "UserCell.h"

@interface FollowingViewController ()

@end

@implementation FollowingViewController

-(id) init
{
    if (self = [super init]) {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}

#pragma mark -
#pragma mark UITableView delegate and dataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"UserCell";
    
    UserCell *cell = (UserCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    // 圆角矩形  效果
    [cell.avatars.layer setCornerRadius:CGRectGetHeight([cell.avatars bounds]) / 2];
    cell.avatars.layer.masksToBounds = YES;

    
    cell.avatars.layer.borderWidth = 1.8;
//    cell.avatars.layer.borderColor = [[UIColor colorWithRed:95/255.0 green:194/255.0 blue:158/255.0 alpha:0.4] CGColor];
    cell.avatars.layer.borderColor = [[UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:0.4] CGColor];

    
    // TODO: configure the cell for the following.
    
    
    return cell;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // TODO: didSelect
}


@end
