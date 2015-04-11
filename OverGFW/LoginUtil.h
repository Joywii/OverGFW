//
//  LoginUtil.h
//  KuaiZhanNativeApp
//
//  Created by karlchen on 11/15/14.
//  Copyright (c) 2014 sohu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface LoginUtil : NSObject

+ (BOOL)CheckMobileStringIsLegal:(NSString *)mobileString;

+(BOOL)isNetworkEnabled;

@end
