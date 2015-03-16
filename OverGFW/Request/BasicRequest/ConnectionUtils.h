//
//  ConnectionUtils.h
//  SohuOauthDemo
//
//  Created by robbie on 13-4-2.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIDevice+Hardware.h"
//#import "Reachability.h"

@interface ConnectionUtils : NSObject

+ (NSString *)userAgentString ;

/* 通过prams字典拼接url */
+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params httpMethod:(NSString *)httpMethod;

/* 通过url参数生成prams字典 */
+ (NSDictionary *)dictionaryFromQueryComponents:(NSString *)query;

/* Utils 生成GET请求Url参数,并且转义 */
+ (NSString *)stringFromDictionary:(NSDictionary *)dict;

/* Utils Called to add UTF-8 string to the post body */
+ (void)appendUTF8Body:(NSMutableData *)body dataString:(NSString *)dataString;

/* 替换"?" */
+ (NSString *)stringWithUrl:(NSString *)originUrl andArgs:(NSArray *)args ;

//+(BOOL)isReachable ;
//
////返回网络连接状态
//+(NetworkStatus)currentReachabilityStatus ;

@end
