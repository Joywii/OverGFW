//
//  LoginUtil.m
//  KuaiZhanNativeApp
//
//  Created by karlchen on 11/15/14.
//  Copyright (c) 2014 sohu. All rights reserved.
//

#import "LoginUtil.h"

@implementation LoginUtil

+ (BOOL)CheckMobileStringIsLegal:(NSString *)mobileString
{
    if (mobileString == nil) {
        return NO;
    }
    NSError * error;
    NSString * pattern = @"^[1][3|5|8][0-9]{9}$";
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSUInteger number = [regex numberOfMatchesInString:mobileString options:0 range:NSMakeRange(0, [mobileString length])];
    if (number != 0) {
        return YES;
    }
    return NO;
}

+(BOOL) isNetworkEnabled
{
    BOOL bEnabled = NO;
    NSString *url = @"www.baidu.com";
    SCNetworkReachabilityRef ref = SCNetworkReachabilityCreateWithName(NULL, [url UTF8String]);
    SCNetworkReachabilityFlags flags;
    
    bEnabled = SCNetworkReachabilityGetFlags(ref, &flags);
    
    CFRelease(ref);
    if (bEnabled) {
        //        kSCNetworkReachabilityFlagsReachable：能够连接网络
        //        kSCNetworkReachabilityFlagsConnectionRequired：能够连接网络，但是首先得建立连接过程
        //        kSCNetworkReachabilityFlagsIsWWAN：判断是否通过蜂窝网覆盖的连接，比如EDGE，GPRS或者目前的3G.主要是区别通过WiFi的连接。
        BOOL flagsReachable = ((flags & kSCNetworkFlagsReachable) != 0);
        BOOL connectionRequired = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
        BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
        bEnabled = ((flagsReachable && !connectionRequired) || nonWiFi) ? YES : NO;
    }
    
    return bEnabled;
}

@end
