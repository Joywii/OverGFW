//
//  GuideViewController.m
//  OverGFW
//
//  Created by 仲 维涛 on 15/3/21.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "GuideViewController.h"
#import "ResignViewController.h"
#import "LoginViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = YES;
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 115)];
    imageView.image = [UIImage imageNamed:@""];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenHeight - 115 + 14, kScreenWidth, 18)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.text = @"科学上网，求得新知";
    [self.view addSubview:titleLabel];
    
    CGFloat flexWidth = (kScreenWidth - 260) / 3.0;
    CGFloat buttonY = kScreenHeight - 115 + 14 + 18 + 14;
    UIButton *resignButton = [self buttonFactoryTitle:@"注册"
                                            withFrame:CGRectMake(flexWidth, buttonY, 130, 40)
                                      backgroundColor:[UIColor themeColor]];
    [resignButton addTarget:self action:@selector(resign:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resignButton];
    
    UIButton *loginButton = [self buttonFactoryTitle:@"登录"
                                           withFrame:CGRectMake(flexWidth * 2 + 130, buttonY, 130, 40)
                                     backgroundColor:[UIColor colorWithRed:60/255.0 green:162/255.0 blue:231/255.0 alpha:1.0]];
    [loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}
- (void)resign:(id)sender
{
    ResignViewController *resignVC = [[ResignViewController alloc] init];
    [self.navigationController pushViewController:resignVC animated:YES];
}
- (void)login:(id)sender
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}
- (UIButton *)buttonFactoryTitle:(NSString *)title withFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = backgroundColor;
    button.layer.cornerRadius = frame.size.height / 2;
//    button.layer.borderWidth = 1.0;
//    button.layer.borderColor = [UIColor themeColor].CGColor;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:button.bounds];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = title;
    [button addSubview:titleLabel];
    
    return button;
}
@end
