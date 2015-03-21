//
//  UserinfoManager.m
//  OverGFW
//
//  Created by 仲 维涛 on 15/3/21.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "UserinfoManager.h"

@implementation UserinfoManager

+ (UserinfoManager *)sharedInstance
{
    static UserinfoManager *userinfoManager;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        userinfoManager = [[UserinfoManager alloc] init];
    });
    return userinfoManager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)isLogin
{
    return NO;
}

- (void)logout
{
    
}

@end
