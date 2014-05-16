//
//  API.h
//  DarlingStreet
//
//  Created by Herbert on 14-5-14.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject

+(API *) sharedInstance;

-(NSDictionary *) requestForBookInfo:(NSString *)bookId;

@end
