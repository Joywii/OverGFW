//
//  ForgetPWViewController.m
//  OverGFW
//
//  Created by 仲 维涛 on 15/4/11.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "ForgetPWViewController.h"
#import "LoginUtil.h"
#import "MBProgressHUD+Window.h"

@interface ForgetPWViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *phoneNumTF;
@property (nonatomic,strong) UITextField *codeTF;
@property (nonatomic,strong) UITextField *passwordTF;
@property (nonatomic,strong) UITextField *onceMoreTF;

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger seconds;

@property (nonatomic,strong) UIButton *codeButton;

@end

@implementation ForgetPWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.title = @"忘记密码";
    
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
    self.seconds = 60;
}
- (void)dealloc
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (void)viewDidDisappear:(BOOL)animated
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.codeButton.enabled = YES;
    [self.codeButton setTitle:@"发送验证码" forState: UIControlStateNormal];
}
- (void)closeKeyboard {
    [self.view endEditing:YES];
}
- (void)backButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setupUI {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 15, kScreenWidth, 180)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UIView *topSpeLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 45, kScreenWidth, 1)];
    topSpeLineView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
    [backView addSubview:topSpeLineView];
    
    UIView *downSpeLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 90, kScreenWidth, 1)];
    downSpeLineView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
    [backView addSubview:downSpeLineView];
    
    UIView *onceSpeLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 135, kScreenWidth, 1)];
    onceSpeLineView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
    [backView addSubview:onceSpeLineView];
    
    self.phoneNumTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, kScreenWidth - 30, 44)];
    self.phoneNumTF.textColor = [UIColor blackColor];
    self.phoneNumTF.font = [UIFont boldSystemFontOfSize:15];
    self.phoneNumTF.placeholder = @"手机号码";
    self.phoneNumTF.delegate = self;
    self.phoneNumTF.keyboardType = UIKeyboardTypePhonePad;
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [backView addSubview:self.phoneNumTF];
    
    self.codeTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 45, kScreenWidth - 100, 44)];
    self.codeTF.textColor = [UIColor blackColor];
    self.codeTF.font = [UIFont boldSystemFontOfSize:15];
    self.codeTF.placeholder = @"验证码";
    self.codeTF.delegate = self;
    self.codeTF.keyboardType = UIKeyboardTypeDefault;
    self.codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [backView addSubview:self.codeTF];
    
    self.codeButton = [self buttonSendCode:CGRectMake(kScreenWidth - 85, 56, 70, 25)];
    [self.codeButton addTarget:self action:@selector(sendSms:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:self.codeButton];
    
    self.passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 90, kScreenWidth - 30, 44)];
    self.passwordTF.textColor = [UIColor blackColor];
    self.passwordTF.font = [UIFont boldSystemFontOfSize:15];
    self.passwordTF.placeholder = @"设定新密码";
    self.passwordTF.delegate = self;
    self.passwordTF.keyboardType = UIKeyboardTypeDefault;
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTF.secureTextEntry = YES;
    [backView addSubview:self.passwordTF];
    
    self.onceMoreTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 135, kScreenWidth - 30, 44)];
    self.onceMoreTF.textColor = [UIColor blackColor];
    self.onceMoreTF.font = [UIFont boldSystemFontOfSize:15];
    self.onceMoreTF.placeholder = @"再输一遍";
    self.onceMoreTF.delegate = self;
    self.onceMoreTF.keyboardType = UIKeyboardTypeDefault;
    self.onceMoreTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.onceMoreTF.secureTextEntry = YES;
    [backView addSubview:self.onceMoreTF];
    
    UILabel *passwordTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 205, kScreenWidth, 15)];
    passwordTipLabel.textColor = [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0];
    passwordTipLabel.font = [UIFont systemFontOfSize:12];
    passwordTipLabel.backgroundColor = [UIColor clearColor];
    passwordTipLabel.text = @"密码至少6位哦";
    [self.view addSubview:passwordTipLabel];
    
    CGFloat flexWidth = (kScreenWidth - 130) / 2.0;
    CGFloat buttonY = 255;
    UIButton *resignButton = [self buttonFactoryTitle:@"完成"
                                            withFrame:CGRectMake(flexWidth, buttonY, 130, 40)
                                      backgroundColor:[UIColor themeColor]];

    [resignButton addTarget:self action:@selector(resign:) forControlEvents:UIControlEventTouchUpInside];
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
- (UIButton *)buttonSendCode:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = frame.size.height / 2;
    button.layer.borderColor = [UIColor themeColor].CGColor;
    button.layer.borderWidth = 1.0;
    button.titleEdgeInsets = UIEdgeInsetsMake(1, 0, 0, 0);
    [button setTitle:@"发送验证码" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor themeColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    return button;
}
- (void)sendSms:(id)sender
{
    self.codeButton.enabled = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
}
- (void)timerFireMethod:(id)sender
{
    if (self.seconds == 1) {
        [self.timer invalidate];
        self.timer = nil;
        self.seconds = 60;
        [self.codeButton setTitle:@"发送验证码" forState: UIControlStateNormal];
        [self.codeButton setEnabled:YES];
    } else {
        NSString *title = [NSString stringWithFormat:@"%ld秒",self.seconds];
        [self.codeButton setTitle:title forState:UIControlStateNormal];
        self.seconds--;
    }
}
- (void)resign:(id)sender
{
    NSLog(@"resign");
    if (self.phoneNumTF.text.length == 0 || ![LoginUtil CheckMobileStringIsLegal:self.phoneNumTF.text]) {
        MBProgressHUD *hud = [MBProgressHUD showAlertMessageInWindows:@"请输入正确的手机号"];
        [hud hide:YES afterDelay:1.0];
        return;
    }
    if (self.codeTF.text.length == 0) {
        MBProgressHUD *hud = [MBProgressHUD showAlertMessageInWindows:@"请输入验证码"];
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
