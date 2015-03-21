//
//  UserinfoManager.h
//  OverGFW
//
//  Created by 仲 维涛 on 15/3/21.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserinfoManager : NSObject

+ (UserinfoManager *)sharedInstance;

- (BOOL)isLogin;

- (void)logout;

@end
