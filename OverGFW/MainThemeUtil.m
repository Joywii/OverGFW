//
//  MainThemeUtil.m
//  KuaiZhanManager
//
//  Created by robbie on 14-5-22.
//  Copyright (c) 2014年 sohu. All rights reserved.
//

#import "MainThemeUtil.h"

@implementation MainThemeUtil

+ (void)themeAppearence
{
    //Navgation字体颜色
    UIColor *titleColor = [UIColor blackColor];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor clearColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: titleColor,
                                                           NSShadowAttributeName: shadow ,NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    [[UINavigationBar appearance] setTintColor:titleColor];
    
//    //Navgation按钮颜色
//    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    
    //Navgation背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIColor imageFromColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //TabBar字体颜色
    UIColor *buttonTextColor = [UIColor colorWithRed:151.0/255.0 green:151.0/255.0 blue:151.0/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: buttonTextColor ,NSFontAttributeName:[UIFont systemFontOfSize:11]}
                                                forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor themeColor] ,NSFontAttributeName:[UIFont systemFontOfSize:11]}
                                             forState:UIControlStateSelected];
    
    
    //TabBar背景颜色
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    //TabBar着色
    [[UITabBar appearance] setTintColor:[UIColor themeColor]];
    
    [[UITabBar appearance] setShadowImage:[UIColor imageFromColor:[UIColor clearColor]]];
    [[UITabBar appearance] setBackgroundImage:[UIColor imageFromColor:[UIColor whiteColor]]];
}

@end