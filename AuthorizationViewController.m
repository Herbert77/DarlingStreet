//
//  AuthorizationViewController.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-16.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "AuthorizationViewController.h"

static NSString * const kAPIKey = @"0cea67cd5648b39d26bf376802da1ad7";
static NSString * const kPrivateKey = @"aede40bd731c4c17";
static NSString * const kRedirectUrl = @"http://www.douban.com/location/mobile";

static NSString * const resure_url = @"http://www.douban.com/location/mobile?error=access_denied";

@interface AuthorizationViewController ()

@end

@implementation AuthorizationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    _webView.delegate = self;
    
    self.navigationController.navigationBarHidden = NO;
    
    NSString *str = [NSString stringWithFormat:@"https://www.douban.com/service/auth2/auth?client_id=%@&redirect_uri=%@&response_type=code", kAPIKey, kRedirectUrl];
    
    NSString *urlStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
   
    [self.view addSubview:_webView];
}

#pragma mark -
#pragma mark  UIWebViewDelegate 

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    BOOL sign = YES;
    
    // 获取请求的 URL
    NSURL *urlObj =  [request URL];
    NSString *targetUrl = [urlObj absoluteString];
    NSLog(@"%@", targetUrl);
    
    NSRange range = [targetUrl rangeOfString:@"http://www.douban.com/location/mobile?code="];
    
    // 授权成功后，截取返回的 URL 中的 token
    if (range.length > 0) {
        
        sign = NO;
        
        NSString *tokenMore = [targetUrl substringFromIndex:range.location+range.length];
        NSString *token = [[tokenMore componentsSeparatedByString:@"&"] objectAtIndex:0];
        NSLog(@"获取的 token = %@", token);
        
        [self back];
      
    }
    
    // 当用户拒接授权时
    if ([targetUrl isEqualToString:resure_url]) {
        
        sign = NO;
        
        [self back];
    }
    
    return sign;
}

-(void) back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
