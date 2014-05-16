//
//  FeedBackController.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-16.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "FeedBackController.h"

@interface FeedBackController ()

@end

@implementation FeedBackController

-(id) init
{
    if (self = [super init]) {
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];         //设置委托
        [mc.navigationBar setTintColor:[UIColor darkGrayColor]];
        mc.mailComposeDelegate = self;
        //设置邮件主题
        [mc setSubject:@"关于 DarlingStreet"];
        //设置收件人
        [mc setToRecipients:[NSArray arrayWithObject:@"595325923@qq.com"]];
        //设置邮件内容
        [mc setMessageBody:@"我想对你说：..." isHTML:NO];
        
        [self presentViewController:mc animated:YES completion:nil];

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];

}

@end
