//
//  KZResponseData.h
//  KuaiZhanManager
//
//  Created by robbie on 14-4-17.
//  Copyright (c) 2014年 sohu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KZResponseData : NSObject

-(id)initWithDictionary:(NSDictionary *)dic;
+(KZResponseData *)objectWithDictionary:(NSDictionary *)dic;

@end
