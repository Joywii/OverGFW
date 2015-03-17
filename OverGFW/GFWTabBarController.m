//
//  GFWViewController.m
//  OverGFW
//
//  Created by joywii on 15/3/9.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "GFWTabBarController.h"
#import "YouMiWall.h"

@interface GFWTabBarController ()

@end

@implementation GFWTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置TabBarItem的图标
    UITabBarItem *firstTabBarItem = [self.tabBar.items objectAtIndex:0];
    UIImage *firstNormalImage = [[UIImage imageNamed:@"tabbaritem1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *firstPressedImage = [[UIImage imageNamed:@"tabbaritem1_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    firstTabBarItem.image = firstNormalImage;
    firstTabBarItem.selectedImage = firstPressedImage;
    
    UITabBarItem *messageTabBarItem = [self.tabBar.items objectAtIndex:1];
    UIImage *messageNormalImage = [[UIImage imageNamed:@"tabbaritem2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *messagePressedImage = [[UIImage imageNamed:@"tabbaritem2_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    messageTabBarItem.image = messageNormalImage;
    messageTabBarItem.selectedImage = messagePressedImage;
    
    
    UITabBarItem *profileTabBarItem = [self.tabBar.items objectAtIndex:2];
    UIImage *profileNormalImage = [[UIImage imageNamed:@"tabbaritem3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *profilePressedImage = [[UIImage imageNamed:@"tabbaritem3_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    profileTabBarItem.image = profileNormalImage;
    profileTabBarItem.selectedImage = profilePressedImage;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pointsGotted:) name:kYouMiPointsManagerRecivedPointsNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kYouMiPointsManagerRecivedPointsNotification object:nil];
}

// 获得积分
- (void)pointsGotted:(NSNotification *)notification {
    NSDictionary *dict = [notification userInfo];
    NSNumber *freshPoints = [dict objectForKey:kYouMiPointsManagerFreshPointsKey];
    NSLog(@"积分信息：%@ %@", dict,freshPoints);
    
    // 手动积分管理可以通过下面这种方法获得每份积分的信息。
    NSArray *pointInfos = dict[kYouMiPointsManagerPointInfosKey];
    for (NSDictionary *aPointInfo in pointInfos) {
        // aPointInfo 是每份积分的信息，包括积分数，userID，下载的APP的名字
        NSLog(@"积分数：%@", aPointInfo[kYouMiPointsManagerPointAmountKey]);
        NSLog(@"userID：%@", aPointInfo[kYouMiPointsManagerPointUserIDKey]);
        NSLog(@"产品名字：%@", aPointInfo[kYouMiPointsManagerPointProductNameKey]);
        
        // TODO 按需要处理
    }
}
@end
