//
//  LoginViewController.m
//  OverGFW
//
//  Created by 仲 维涛 on 15/3/21.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginUtil.h"
#import "MBProgressHUD+Window.h"
#import "ForgetPWViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

<<<<<<< HEAD
@property (nonatomic,strong) UITextField *phoneNumTF;
@property (nonatomic,strong) UITextField *passwordTF;
=======
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UILabel *phonePlaceLabel;
>>>>>>> 06375c756920aab15c7f88196b4ae89ee6343a50

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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
    
    [self setupUI];
}
- (void)backButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)closeKeyboard {
    [self.view endEditing:YES];
}
- (void)setupUI {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 15, kScreenWidth, 90)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UIView *topSpeLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 45, kScreenWidth, 1)];
    topSpeLineView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
    [backView addSubview:topSpeLineView];
    
    UIView *downSpeLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 90, kScreenWidth, 1)];
    downSpeLineView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
    [backView addSubview:downSpeLineView];
    
    self.phoneNumTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, kScreenWidth - 30, 44)];
    self.phoneNumTF.textColor = [UIColor blackColor];
    self.phoneNumTF.font = [UIFont boldSystemFontOfSize:15];
    self.phoneNumTF.placeholder = @"手机号码";
    self.phoneNumTF.delegate = self;
    self.phoneNumTF.keyboardType = UIKeyboardTypePhonePad;
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [backView addSubview:self.phoneNumTF];
    
    self.passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 45, kScreenWidth - 30, 44)];
    self.passwordTF.textColor = [UIColor blackColor];
    self.passwordTF.font = [UIFont boldSystemFontOfSize:15];
    self.passwordTF.placeholder = @"密码";
    self.passwordTF.delegate = self;
    self.passwordTF.keyboardType = UIKeyboardTypeDefault;
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTF.secureTextEntry = YES;
    [backView addSubview:self.passwordTF];
    
    UIButton *forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetButton.backgroundColor = [UIColor clearColor];
    forgetButton.frame = CGRectMake(kScreenWidth - 75, 115, 65, 15);
    forgetButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [forgetButton setTitleColor:[UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [forgetButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [self.view addSubview:forgetButton];
    [forgetButton addTarget:self action:@selector(forgetPW:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat flexWidth = (kScreenWidth - 130) / 2.0;
    CGFloat buttonY = 210 - 45;
    UIButton *resignButton = [self buttonFactoryTitle:@"登录"
                                            withFrame:CGRectMake(flexWidth, buttonY, 130, 40)
                                      backgroundColor:[UIColor colorWithRed:60/255.0 green:162/255.0 blue:231/255.0 alpha:1.0]];
    [resignButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resignButton];
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
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = title;
    [button addSubview:titleLabel];
    
    return button;
}
- (void)forgetPW:(id)sender
{
    ForgetPWViewController *forgetPW = [[ForgetPWViewController alloc] init];
    [self.navigationController pushViewController:forgetPW animated:YES];
}
- (void)login:(id)sender
{
    NSLog(@"resign");
    if (self.phoneNumTF.text.length == 0 || ![LoginUtil CheckMobileStringIsLegal:self.phoneNumTF.text]) {
        MBProgressHUD *hud = [MBProgressHUD showAlertMessageInWindows:@"请输入正确的手机号"];
        [hud hide:YES afterDelay:1.0];
        return;
    }
    if (self.passwordTF.text.length < 6) {
        MBProgressHUD *hud = [MBProgressHUD showAlertMessageInWindows:@"请输入至少6位的密码"];
        [hud hide:YES afterDelay:1.0];
        return;
    }
    
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.phoneNumTF) {
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 11) ? NO : YES;
    }
    return YES;
}
@end
