//
//  LoginViewController.m
//  OverGFW
//
//  Created by 仲 维涛 on 15/3/21.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.view.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.title = @"注册";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"topbar-back-icon"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"topbar-back-icon"] forState:UIControlStateHighlighted];
    backButton.frame = CGRectMake(0, 0, 25, 25);
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *fixedSpaceRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixedSpaceRight setWidth:-0.0];
    
    self.navigationItem.leftBarButtonItems = @[fixedSpaceRight,backButtonItem];
}
- (void)backButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
@end
