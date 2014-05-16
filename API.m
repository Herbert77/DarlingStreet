//
//  API.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-14.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "API.h"

#import "NSDictionary+Book.h"

static NSString *const BaseURLString = @"https://api.douban.com/v2/book/";

@interface API () {
    NSDictionary *bookInfo;
}

@end


@implementation API


+(API *) sharedInstance
{
    static API *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[API alloc] init];
    });
    
    return _sharedInstance;
}

-(NSDictionary *) requestForBookInfo:(NSString *)bookId
{
    NSString *string = [NSString stringWithFormat:@"%@%@", BaseURLString, bookId];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
   
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        bookInfo = (NSDictionary *)responseObject;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error");
    }];
    
    [operation start];
    if (bookInfo != nil) {
//        Book *newBook = [[Book alloc] initWithTitle:[bookInfo title] writer:[bookInfo writer] publisher:[bookInfo publisher] nameOfCover:[bookInfo nameOfCover:@"small"] ISBN:[bookInfo isbn] summary:[bookInfo summary]];
//        
//        [self addBook:newBook atIndex:0];
        NSLog(@"bookInfo != nil");
        return bookInfo;
        
    } else {
        NSLog(@"bookInfo = nil");
        return nil;
    }

}

@end
