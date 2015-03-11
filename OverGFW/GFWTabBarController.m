//
//  GFWViewController.m
//  OverGFW
//
//  Created by joywii on 15/3/9.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "GFWTabBarController.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
