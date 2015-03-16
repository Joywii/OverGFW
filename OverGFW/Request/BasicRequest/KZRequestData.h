//
//  KZRequestData.h
//  KuaiZhanManager
//
//  Created by robbie on 14-4-17.
//  Copyright (c) 2014年 sohu. All rights reserved.
//

#import <Foundation/Foundation.h>


// 请求对象
@interface KZRequestData : NSObject

-(NSDictionary *)requestDictionary;
-(NSDictionary *)requestDataDictionary ;

@end

// 请求头信息
@interface KZRequestHeaderData : NSObject

-(NSDictionary *)allHeaderDictionary;

@end


// 响应内容
@interface KZDispatchData : NSObject

@property (nonatomic, assign) int statusCode;

-(id)dispatchData:(id)result;

@end
