//
//  TeamViewController.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-12.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "TeamViewController.h"

@interface TeamViewController ()

@end

@implementation TeamViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"team_introduction_image.png"];
    
    [self.view addSubview:imageView];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(back:)];
    
    self.navigationController.navigationBarHidden = NO;
    
    [[self navigationItem] setLeftBarButtonItem:back];
    
}

-(void) back:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
