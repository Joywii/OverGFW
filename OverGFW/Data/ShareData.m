//
//  ShareData.m
//  OverGFW
//
//  Created by joywii on 15/3/16.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "ShareData.h"

@interface ShareData ()

@property (nonatomic,strong) NSMutableArray *shareAPPS;

@end

@implementation ShareData

- (ShareData *)shareData
{
    static ShareData *shareData;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        shareData = [[ShareData alloc] init];
    });
    return shareData;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _shareAPPS = [NSMutableArray array];
    }
    return self;
}
@end
