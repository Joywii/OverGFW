//
//  KZResponseData.m
//  KuaiZhanManager
//
//  Created by robbie on 14-4-17.
//  Copyright (c) 2014年 sohu. All rights reserved.
//

#import "KZResponseData.h"


@implementation KZResponseData

-(id)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        
    }
    return self;
}

+(KZResponseData *)objectWithDictionary:(NSDictionary *)dic
{
    return [[self alloc] initWithDictionary:dic];
}

@end
