//
//  LoginViewController.m
//  OverGFW
//
//  Created by 仲 维涛 on 15/3/21.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UILabel *phonePlaceLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.view.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.title = @"欢迎回来";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"topbar-back-icon"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"topbar-back-icon"] forState:UIControlStateHighlighted];
    backButton.frame = CGRectMake(0, 0, 25, 25);
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *fixedSpaceRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixedSpaceRight setWidth:-0.0];
    
    self.navigationItem.leftBarButtonItems = @[fixedSpaceRight,backButtonItem];
    
    UIView *whiteBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 15, kScreenWidth, 45*2 + 1)];
    whiteBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteBackView];
    UIView *sperateView = [[UIView alloc] initWithFrame:CGRectMake(0, 45, kScreenWidth, 1)];
    sperateView.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];
    [whiteBackView addSubview:sperateView];
    
    
    self.phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 1, kScreenWidth - 15, 44)];
    [self.phoneTextField setDelegate:self];
    [self.phoneTextField  setReturnKeyType:UIReturnKeyDone];
    [self.phoneTextField  setBackgroundColor:[UIColor clearColor]];
    self.phoneTextField.font = [UIFont systemFontOfSize:15.0];
    self.phoneTextField.textColor = [UIColor blackColor];
    self.phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.phoneTextField.text = @"";
    [self.phoneTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [whiteBackView addSubview:self.phoneTextField];
    
    self.phonePlaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 15, 45)];
    self.phonePlaceLabel.backgroundColor = [UIColor clearColor];
    self.phonePlaceLabel.font = [UIFont systemFontOfSize:15];
    self.phonePlaceLabel.textColor = [UIColor colorWithRed:184.0/255.0 green:184.0/255.0 blue:184.0/255.0 alpha:1.0];
    self.phonePlaceLabel.text = @"手机号码";
    [self.phoneTextField addSubview:self.phonePlaceLabel];
    
}
- (void)backButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)textFieldDidChange:(id)sender
{
    UITextField *textField = (UITextField *)sender;
    
    if (textField == self.phoneTextField) {
        if ([textField.text isEqualToString:@""]) {
            self.phonePlaceLabel.hidden = NO;
        } else {
            self.phonePlaceLabel.hidden = YES;
        }
    }
}
@end
