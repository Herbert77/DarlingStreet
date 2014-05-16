//
//  NSDictionary+Book.h
//  DarlingStreet
//
//  Created by Herbert on 14-5-14.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Book)

- (NSString *)title;
- (NSString *)writer;
- (NSString *)publisher;
- (NSString *)nameOfCover:(NSString *)size;
- (NSString *)isbn;
- (NSString *)summary;


@end
