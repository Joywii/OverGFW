//
//  ConnectionUtils.m
//  SohuOauthDemo
//
//  Created by robbie on 13-4-2.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "ConnectionUtils.h"

@implementation ConnectionUtils

+ (NSString *)userAgentString
{
    //@"KuaiZhan/1.0(Linux;Android4.04;zh-cn;SAMSUNG-GT-S7568_TD)"
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *kuaizhan = @"KuaiZhan" ;
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *hardwareDescription = [[UIDevice currentDevice] hardwareDescription] ;
    float hardwareVersion = DEVICE_IOS_VERSION  ;
    NSString *language = @"zh-cn" ;
    NSString *deviceType = @"appStore";
    return [NSString stringWithFormat:@"%@/%@(%@;iOS%f;%@;%@)",kuaizhan,version,hardwareDescription,hardwareVersion,language,deviceType] ;
}

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params httpMethod:(NSString *)httpMethod
{
    if (![httpMethod isEqualToString:@"GET"])
    {
        return baseURL;
    }
    
    NSURL *parsedURL = [NSURL URLWithString:baseURL];
	NSString *queryPrefix = parsedURL.query ? @"&" : @"?";
	NSString *query = [self stringFromDictionary:params];
    
	return [NSString stringWithFormat:@"%@%@%@", baseURL, queryPrefix, query];
}

+ (NSDictionary *)dictionaryFromQueryComponents:(NSString *)query
{
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	for (NSString *pair in pairs) {
		NSArray *kv = [pair componentsSeparatedByString:@"="];
        if (kv.count == 2) {
            NSString *val =[[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [params setObject:val forKey:[kv objectAtIndex:0]];
        }
	}
    return params;
}


+ (NSString *)stringFromDictionary:(NSDictionary *)dict
{
    NSMutableArray *pairs = [NSMutableArray array];
	for (NSString *key in [dict keyEnumerator])
	{
        id value = [dict valueForKey:key];
		if (!([value isKindOfClass:[NSString class]]))
		{
            continue;
		}
        
        NSString* escapedValue = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                     NULL,
                                                                                     (CFStringRef)value,
                                                                                     NULL,
                                                                                     (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                     kCFStringEncodingUTF8));		
		[pairs addObject:[NSString stringWithFormat:@"%@=%@", key, escapedValue]];
        
	}
	return [pairs componentsJoinedByString:@"&"];
}

+ (void)appendUTF8Body:(NSMutableData *)body dataString:(NSString *)dataString
{
    [body appendData:[dataString dataUsingEncoding:NSUTF8StringEncoding]];
}

+ (NSString *)stringWithUrl:(NSString *)originUrl andArgs:(NSArray *)args
{
    NSMutableString *mString = [[NSMutableString alloc]initWithString:@""];
    NSArray *splitArray = [originUrl componentsSeparatedByString:@"?"];
    NSUInteger count = [splitArray count];
    
    if(count!=[args count]+1) return @"";

    for(int i =0 ;i<count ;i++)
    {
        [mString appendString:splitArray[i]];
        if(i!=count-1)
        {
            [mString appendString:args[i]];
        }
    }
    return mString;
}

//+(BOOL)isReachable
//{
//    return [[Reachability reachabilityForInternetConnection] isReachable];
//}

////返回网络连接状态
//+(NetworkStatus)currentReachabilityStatus
//{
//    return [[Reachability reachabilityForInternetConnection] currentReachabilityStatus] ;
//}



@end
