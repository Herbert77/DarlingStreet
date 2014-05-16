//
//  NSDictionary+Book.m
//  DarlingStreet
//
//  Created by Herbert on 14-5-14.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "NSDictionary+Book.h"

@implementation NSDictionary (Book)

- (NSString *)title
{
    return [self objectForKey:@"title"];
}

- (NSString *)writer
{
    //    return [self objectForKey:@"author"];
    NSArray *author = [self objectForKey:@"author"];
    return [author objectAtIndex:0];
    
}

- (NSString *)publisher
{
    return [self objectForKey:@"publisher"];
}

// size 分为： small , large 和 medium
- (NSString *)nameOfCover:(NSString *)size
{
    NSDictionary *dic = [self objectForKey:@"images"];
    return [dic objectForKey:[NSString stringWithFormat:@"%@",size]];
}

- (NSString *)isbn
{
    return [self objectForKey:@"isbn10"];
}

- (NSString *)summary
{
    return [self objectForKey:@"summary"];
}

@end
