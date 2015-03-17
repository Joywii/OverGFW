//
//  ShareData.h
//  OverGFW
//
//  Created by joywii on 15/3/16.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareData : NSObject

@property (nonatomic,strong) NSMutableArray *shareAPPS;

+ (ShareData *)shareData;

@end
